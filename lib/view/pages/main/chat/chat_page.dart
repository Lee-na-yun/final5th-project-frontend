import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/models/test/users.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/chat/components/chat_list.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/components/chat_app_bar.dart';

import 'chat_add_room_page.dart';
import 'chat_test_add_room_page.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatAppBar(),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('chat_room').orderBy('createdAt').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<DocumentSnapshot> documents = snapshot.data!.docs;
            return ListView(
              padding: EdgeInsets.only(top: 12, left: 20, right: 20),
              children:
                  List.generate(documents.length, (index) => ChatList(user: users[index], chatroom: documents[index])),

            );
          }
          return Center(child: Text('로드 중……'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(CupertinoIcons.add),
        onPressed: () async {
          await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return ChatAddRoomPage();
          }));
        },
      ),

      //ChatList(user: users[1]),
      //RoomListPageTest(),
      //     ListView(
      //   padding: EdgeInsets.only(top: 12, left: 20, right: 20),
      //   children: List.generate(users.length, (index) => ChatList(user: users[index])),
      // ),
    );
  }
}
