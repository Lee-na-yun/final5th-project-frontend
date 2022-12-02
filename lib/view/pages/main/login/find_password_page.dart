import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/login/components/custom_form.dart';
import '../components/default_button.dart';
import '../components/line_app_bar.dart';

class FindPasswordPage extends StatelessWidget {
  const FindPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: LineAppBar("비밀번호 찾기"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(height: 30),
            CustomForm("이메일", "이메일을 입력해주세요"),
            SizedBox(height: 24),
            DefaultButton("확인", "/login"),
          ],
        ),
      ),
    );
  }
}
