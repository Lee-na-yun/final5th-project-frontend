import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/components/chat_app_bar.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/components/default_button.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/components/home_app_bar.dart';

import '../components/line_app_bar.dart';

class MyPageProfilePage extends StatelessWidget {
  const MyPageProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: LineAppBar("프로필 수정"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: klightGreyColor(),
                        border: Border.all(width: 1, color: kchacholGreyColor()),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                    ),
                    Positioned(
                      bottom: 6,
                      right: -6,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/photo_plus_icon.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 48),
            Column(
              children: [
                _buildColumnForm("닉네임", "닉네임을 입력해주세요"),
                SizedBox(height: 24),
                _buildColumnForm("자기소개", "자기소개를 입력해주세요"),
                SizedBox(height: 32),
                DefaultButton(routes: "/mypage", btnText: "확인")
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column _buildColumnForm(String text, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: textTheme(color: kchacholGreyColor()).bodyText2,
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.only(top: 10, bottom: 9, left: 10),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: kmidGreyColor()),
            ),
            hintStyle: textTheme(color: kmidGreyColor(), weight: FontWeight.bold).headline3,
          ),
        ),
      ],
    );
  }
}
