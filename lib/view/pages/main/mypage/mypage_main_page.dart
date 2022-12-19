import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/models/test/todo.dart';
import 'package:riverpod_firestore_steam1/models/test/users.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/components/home_app_bar.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/mypage/components/mypage_app_bar.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/mypage/components/mypage_profile.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/mypage/components/profile_tab.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/mypage/components/profile_tab_v2.dart';

class MyPageMainPage extends StatelessWidget {
  const MyPageMainPage({Key? key, this.userInfo}) : super(key: key);
  final userInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(null, context: context),
      body: Column(
        children: [
          SizedBox(height: 22),
          MypageProfile(userInfo: userInfo),
          SizedBox(height: 24),
          Expanded(child: ProfileTabV2()),
        ],
      ),
    );
  }
}
