import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/components/chat_app_bar.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatAppBar(),
      body: ListView(
        padding: EdgeInsets.only(top: 12, left: 20, right: 20),
        children: [
          _buildChatBox(),
          _buildChatBox(),
          _buildChatBox(),
        ],
      ),
    );
  }

  Widget _buildChatBox() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Container(
              width: 40,
              height: 40,
              color: theme().primaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0, right: 34),
            child: Container(
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("상대방이름", style: textTheme().headline3),
                  Text(
                    "대화 내용 입니다대화 내용 입니다대화 내용 입니다대화 내용 입니다대화 내용 입니다",
                    style: TextStyle(
                      height: 1.6,
                      fontSize: 12,
                      fontWeight: FontWeight.w200,
                      color: Color(0xff9999A3),
                      letterSpacing: -0.5,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ),
          Text(
            "오후 17:30",
            style: textTheme().bodyText2,
          ),
        ],
      ),
    );
  }
}
