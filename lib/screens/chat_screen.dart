import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/*
Uses Supabase to update instantly in .stream()
1) Right -> user
2) Left -> other users

Calls moderate-message func before sending message
*/

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final supabase = Supabase.instance.client;
  final TextEditingController _controller = TextEditingController();

  late final Stream<List<Map<String, dynamic>>> _messageStream;

  @override
  void initState() {
    super.initState();

    // Real-time stream of messages ordered by created_at descending
    _messageStream = supabase
        .from('messages')
        .stream(primaryKey: ['id'])
        .order('created_at');
  }

  // Local word filter (optional for instant blocking)
  bool containsBadWords(String text) {
    final banned = ['badword1', 'badword2'];
    return banned.any((w) => text.toLowerCase().contains(w));
  }

Future<void> sendMessage() async {
  final text = _controller.text.trim();
  if (text.isEmpty) return;

  final user = supabase.auth.currentUser;
  if (user == null) return;

  // Local filter (optional)
  final banned = ['badword1', 'badword2'];
  if (banned.any((w) => text.toLowerCase().contains(w))) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Message blocked locally")),
    );
    return;
  }

  try {
    final token = supabase.auth.currentSession?.accessToken;
    if (token == null) throw Exception("No access token available");

    final res = await supabase.functions.invoke(
      'moderate-message',
      body: {'content': text},
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    // Safely parse JSON
    Map<String, dynamic> data = {};
    if (res.data != null && res.data is Map) {
      data = Map<String, dynamic>.from(res.data);
    }

    final flagged = data['flagged'] == true;
    if (flagged) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Message blocked by moderation")),
      );
      return;
    }

    // Insert message into Supabase
    await supabase.from('messages').insert({
      'content': text,
      'user_id': user.id,
      'username': user.email,
      'created_at': DateTime.now().toIso8601String(),
    });

    _controller.clear();
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Error sending message: $e")),
    );
  }
}

  Widget buildMessageBubble(Map<String, dynamic> message) {
    final isMe = message['user_id'] == supabase.auth.currentUser?.id;

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isMe ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            if (message['username'] != null)
              Text(
                message['username'],
                style: const TextStyle(fontSize: 10, color: Colors.black54),
              ),
            const SizedBox(height: 4),
            Text(
              message['content'] ?? '',
              style: TextStyle(
                color: isMe ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat Room"),
      ),
      body: Column(
        children: [
          // Message list
          Expanded(
            child: StreamBuilder<List<Map<String, dynamic>>>(
              stream: _messageStream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final messages = snapshot.data!;

                return ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[messages.length - 1 - index];
                    return buildMessageBubble(message);
                  },
                );
              },
            ),
          ),

          // Input box
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            color: Colors.grey[200],
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "Type a message...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: sendMessage,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}