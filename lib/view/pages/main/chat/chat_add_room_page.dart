import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/components/chat_app_bar.dart';

class ChatAddRoomPage extends StatefulWidget {
  const ChatAddRoomPage({Key? key}) : super(key: key);

  @override
  State<ChatAddRoomPage> createState() => _ChatAddRoomPageState();
}

class _ChatAddRoomPageState extends State<ChatAddRoomPage> {
  String roomName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatAppBar(),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: '채팅방 이름을 작성해 주세요'),
                keyboardType: TextInputType.multiline,
                maxLength: 30,
                maxLines: 1,
                onChanged: (String value) {
                  setState(() {
                    roomName = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: '채팅방 설명을 입력해 주세요'),
                keyboardType: TextInputType.multiline,
                maxLines: 1,
                onChanged: (String value) {
                  setState(() {
                    roomName = value;
                  });
                },
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('작성'),
                  onPressed: () async {
                    final date = DateTime.now();

                    await FirebaseFirestore.instance.collection('chat_room').doc(roomName).set({
                      'name': roomName,
                      'createdAt': DateFormat("a hh:mm").format(date).replaceAll("AM", "오전").replaceAll("PM", "오후"),
                    });
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
