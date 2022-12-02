import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/models/todo.dart';
import 'package:riverpod_firestore_steam1/models/users.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/mypage/components/mypage_app_bar.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/mypage/components/mypage_profile.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/mypage/components/profile_tab.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/mypage/components/profile_tab_v2.dart';

class MyPageMainPage extends StatelessWidget {
  const MyPageMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyPageAppBar(),
      body: Column(
        children: [
          SizedBox(height: 22),
          MypageProfile(),
          SizedBox(height: 24),
          Expanded(
            child: ListView(
                children:
                    List.generate(ToDoList.length, (index) => ProfileTabV2())),
          ),
        ],
      ),
    );
  }
}
