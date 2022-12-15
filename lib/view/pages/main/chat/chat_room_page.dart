import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/chat/components/my_chat.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/chat/components/other_chat.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/components/line_app_bar.dart';

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
        child: LineAppBar("상대방이름", null),
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
      //padding: EdgeInsets.symmetric(horizontal: 20),
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
          SizedBox(width: 10),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icon_bottom_plus.svg", width: 24),
            padding: EdgeInsets.zero,
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
                onPressed: () {
                  setState(() {
                    _handleSubmitted;
                  });
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                ),
                child: Text(
                  "전송",
                  style: textTheme(color: Colors.white, weight: FontWeight.w600).headline3,
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
