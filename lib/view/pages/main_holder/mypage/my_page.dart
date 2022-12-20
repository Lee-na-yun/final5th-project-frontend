import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/models/test/todo.dart';
import 'package:riverpod_firestore_steam1/models/test/users.dart';
import 'package:riverpod_firestore_steam1/view/components/home_app_bar.dart';
import 'package:riverpod_firestore_steam1/view/pages/main_holder/mypage/components/mypage_app_bar.dart';
import 'package:riverpod_firestore_steam1/view/pages/main_holder/mypage/components/my_page_body.dart';
import 'package:riverpod_firestore_steam1/view/pages/main_holder/mypage/components/profile_tab_v2.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(null, context: context),
      body: Column(
        children: [
          SizedBox(height: 22),
          MyPageBody(),
          SizedBox(height: 24),
          Expanded(child: ProfileTabV2()),
        ],
      ),
    );
  }
}
