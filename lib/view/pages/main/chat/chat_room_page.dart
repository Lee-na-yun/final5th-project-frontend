import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/models/users.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/chat/components/chat_line_app_bar.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/chat/components/chat_list.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/chat/components/my_chat.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/chat/components/other_chat.dart';

class ChatRoomPage extends StatefulWidget {
  const ChatRoomPage({Key? key}) : super(key: key);

  @override
  State<ChatRoomPage> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  final List<MyChat> chats = [];
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: ChatLineAppBar("상대방이름"),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Scaffold(
          //backgroundColor: Colors.white,
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Column(
                      children: [
                        OtherChat(time: "오전 10:25", name: "홍길동", text: "야ㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑ이것봐바!"),
                        SizedBox(height: 6),
                        MyChat(text: "오 나 필요한건데 ㄳㄳ", time: "오후 17:38"),
                        ...List.generate(chats.length, (index) => chats[index]),
                      ],
                    ),
                  ),
                ),
              ),
              _buildSubmitContainer(),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildSubmitContainer() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            width: 1,
            color: Color(0xffd9d9d9),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: Image.asset("assets/chat_flus.png", width: 18, height: 18),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: TextField(
                controller: _textController,
                maxLines: 1,
                style: textTheme().headline3,
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
                onSubmitted: _handleSubmitted,
              ),
              height: 40,
              //width: 226,
              decoration: BoxDecoration(
                color: Color(0xfff2f2f2),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(width: 6),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: theme().primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                ),
                child: Text(
                  "전송",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    height: 1.6,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleSubmitted(text) {
    _textController.clear();

    setState(() {
      chats.add(
        MyChat(
          text: text,
          time: DateFormat("a K:m").format(new DateTime.now()).replaceAll("AM", "오전").replaceAll("PM", "오후"),
        ),
      );
    });
  }
}
