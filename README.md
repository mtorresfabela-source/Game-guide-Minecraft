# CraftHub (Working Title)
A community-driven companion application serving as a guide for players who do not consider themselves technically-saavy. It combines structured guides in multiple formats with additional social features inspired by Amino and Discord.

Location: C:\Users\user\develop\game_companion

## Overview
Here, we introduce a companion platform for Minecraft that blends detailed game guides, tutorials and walkthroughs with interactive community features, including posts, chats, profiles and curated content feeds all in one safe, convenient location.

## Dependencies
1) Dart SDK 3.11.1
2) Node.js 24.14.1
3) Flutter SDK 3.41.3
4) Supabase 2.84.2
5) cloud_firestore 6.2.0
6) cloud_firestore_platform_interface 7.1.0
7) flutterfire_internals 1.3.68
8) cloud_firestore_web 5.2.0
9) cupertino_icons 1.0.9
10) firebase_auth 6.3.0
11) firebase_auth_platform_interface 8.1.8
12) firebase_auth_web 6.1.4
13) http_parser 4.1.2
14) typed_data 1.4.0
15) firebase_core 4.6.0
16) firebase_core_platform_interface 6.0.3
17) plugin_platform_interface 2.1.8
18) firebase_core_web 3.5.1
19) flutter_web_plugins 0.0.0
20) web 1.1.1
21) firebase_storage 13.2.0
22) firebase_storage_platform_interface 5.2.19
23) firebase_storage_web 3.11.4
24) async 2.13.1
25) http 1.6.0
26) mime 2.0.0
27) flutter 0.0.0
28) characters 1.4.1
29) collection 1.19.1
30) material_color_utilities 0.13.0
31) meta 1.17.0
32) sky_engine 0.0.0
33) vector_math 2.2.0
34) flutter_lints 6.0.0
35) lints 6.1.0
36) flutter_test 0.0.0
37) clock 1.1.2
38) fake_async 1.3.3
39) leak_tracker_flutter_testing 3.0.10
40) leak_tracker 11.0.2
41) vm_service 15.0.2
42) leak_tracker_testing 3.0.2
43) matcher 0.12.18
44) path 1.9.1
45) stack_trace 1.12.1
46) stream_channel 2.1.4
47) test_api 0.7.9
48) boolean_selector 2.1.2
49) source_span 1.10.2
50) string_scanner 1.4.1
51) term_glyph 1.2.2
52) firebase_functions
53) open ai
54) firebase-admin

**Our companion app supports Minecraft players across:**
1. Survival
2. Creative
3. Hardcore
4. Multiplayer servers
5. Modded gameplay
6. Speedrunning
7. Redstone engineering
8. PvP
9. Building
10. Aesthetic designing

## Features (ip)
### Game Guides
1. Biome breakdowns
2. Mob statistics
3. Crafting recipes
4. Redstone tutorials
5. Boss fight strategies
6. Beginner-to-advanced progression guides
7. Version-specific differences, such as Java vs. Bedrock

### Community Features
1. User profiles, including a leveling system
2. Customizable avatars
3. Public posting
4. Comment threads
5. Community and group chats
6. Follow/follower system
7. Featured content
8. Reputation system

### Gamification
1. XP gained for user engagement
2. Achievement badges
3. Daily challenges
4. Leaderboards
5. Community events

## Technology Stack (ip)
Frontend: Flutter
Backend: Firebase
Database: PostgreSQL
Authentication: OAuth/Email/Discord login?
Hosting: Vercel/AWS/DigitalOcean?

## Project Structure (ip)
lib
 ├── core/
 │   ├── theme/
 │   ├── constants/
 │   └── utils/
 │
 ├── database/
 │   ├──
 │   ├──
 │   └──

lib/features/
 ├── auth/
 │   ├── login_screen.dart
 │   ├── register_screen.dart
 │   └── auth_service.dart
 │
 ├── guides/
 │   ├── guide_model.dart
 │   ├── guide_list_screen.dart
 │   ├── guide_detail_screen.dart
 │   └── guide_repository.dart
 │
 ├── community/
 │   ├── post_model.dart
 │   ├── feed_screen.dart
 │   ├── create_post_screen.dart
 │   └── comment_widget.dart
 │
 ├── profile/
 │   ├── profile_screen.dart
 │   └── user_model.dart
 │
 └── chat/
     ├── chat_screen.dart
     └── message_model.dart

 │
 ├── models/
 │   ├──
 │   ├──
 │   └──
 │
 │
 ├── routes/
 │   ├──
 │   ├──
 │   └──
 │
 │
 ├── screens/
 │   ├──
 │   ├──
 │   └──
 │
 │
 ├── services/
 │   ├──
 │   ├──
 │   └──
 │
 │
 ├── widgets/
 │   ├──
 │   ├──
 │   └──
 │
main.dart

## Prerequisites (ip)
1. Node.js (v18+ recommended)
2. npm or yarn
3. Git

## Installation (ip)
git clone https://github.com/yourusername/crafthub.git
cd crafthub
npm install
npm run dev

## Roadmap (ip)
1. User authentication
2. Post creation and commenting
3. Guide publishing system
4. Moderation tools
5. Dark mode
6. Mobile app version
7. Server-specific communities
8. Marketplace for schematics

## Moderation and Community Guidelines (ip)
Moderators reserve the right to remove harmful content. To maintain a positive community on our platform, we advise:
1. Be respectful
2. No griefing-related promotion allowed
3. No hate speech allowed
4. No spam allowed
5. Follow Minecraft's general EULA guidelines

## Disclaimer
This is a fan-made application not affiliated with Mojang Studios or Microsoft. Minecraft is a trademark of Mojang Studios.

## Vision
Our goal is to create a safe, interactive and community-powered platform for Minecraft players, so they can connect more efficiently beyond the game.
