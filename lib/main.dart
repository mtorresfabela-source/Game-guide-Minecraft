import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:game_companion/screens/home_page.dart';   // HomePage

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://xreshwvdbthbnlzoetff.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhyZXNod3ZkYnRoYm5sem9ldGZmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzQ4MjM1MTIsImV4cCI6MjA5MDM5OTUxMn0.0cfg-I0soHiAPSVfSLlfrj-irIecOnErJy9QZAR5s88',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Game Companion Login'),
    );
  }
}
