import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/chat/chat_test_add_room_page.dart';

import 'chat_test_page.dart';

class RoomListPageTest extends StatelessWidget {
  // 引数からユーザー情報を受け取れるようにする
  // 사용자의 정보를 받아 온다ㅁ내ㅑ
  RoomListPageTest();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              // Stream 非同期処理の結果を元にWidgetを作る
              //비동기 처리 결과를 바탕으로 Widget 만들기
              child: StreamBuilder<QuerySnapshot>(
            // 投稿メッセージ一覧の取得 / 게시 메시지 목록 얻기
            stream: FirebaseFirestore.instance.collection('chat_room').orderBy('createdAt').snapshots(),
            builder: (context, snapshot) {
              // データが取得できた場合 / 데이터를 검색할 수 있는 경우 데이터 있으면
              if (snapshot.hasData) {
                final List<DocumentSnapshot> documents = snapshot.data!.docs;
                return ListView(
                  children: documents.map((document) {
                    return Card(
                      child: ListTile(
                        title: Text(document['name']),
                        trailing: IconButton(
                          icon: Icon(Icons.input),
                          onPressed: () async {
                            // チャットページへ画面遷移 /채팅 페이지로 이동
                            await Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return ChatPage(document['name']); //ChatPage(document['name']);
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }).toList(),
                );
              }
              // データが読込中の場合 / 데이터 수신 하는 동안 뜨는 객체
              return Center(
                child: Text('읽는 중……'), //読込中
              );
            },
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          //Navigator.popAndPushNamed(context, Move.chatRoomPageTest);
          await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return AddRoomListTest();
          }));
        },
      ),
    );
  }
}
