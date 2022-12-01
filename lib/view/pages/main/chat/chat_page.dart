import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/models/users.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/chat/components/chat_list.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/components/chat_app_bar.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatAppBar(),
      body: ListView(
        padding: EdgeInsets.only(top: 12, left: 20, right: 20),
        children: List.generate(users.length, (index) => ChatList(user: users[index])),
      ),
    );
  }
}
