import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class AddRoomListTest extends StatefulWidget {
  AddRoomListTest();

  @override
  _AddPostPageState createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddRoomListTest> {
  String roomName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('채팅 방 만들기'), //ルーム作成
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: '채팅방 이름을 작성해 주세요'), //チャットルーム名
                keyboardType: TextInputType.multiline,
                maxLength: 30,
                maxLines: 1,
                onChanged: (String value) {
                  setState(() {
                    roomName = value;
                  });
                },
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('작성'),
                  onPressed: () async {
                    final date = DateTime.now();

                    await FirebaseFirestore.instance.collection('chat_room').doc(roomName).set({
                      'name': roomName,
                      'createdAt':
                          DateFormat("y MMM d a hh:mm").format(date).replaceAll("AM", "오전").replaceAll("PM", "오후"),
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
