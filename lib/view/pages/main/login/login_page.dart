import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/login/components/custom_form.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/login/components/default_button.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/login/components/line_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              SizedBox(height: 110),
              Center(
                child: Text(
                  "TODOFRIENDS",
                  style: GoogleFonts.notoSans(
                    fontSize: 38,
                    fontWeight: FontWeight.w900,
                    color: theme().primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 70),
              CustomForm("이메일", "이메일을 입력해주세요"),
              SizedBox(height: 18),
              CustomForm("비밀번호", "비밀번호를 입력해주세요"),
              SizedBox(height: 40),
              DefaultButton("로그인"),
              SizedBox(height: 14),
              LineButton("회원가입"),
              SizedBox(height: 14),
              Text("비밀번호 찾기", style: TextStyle(fontSize: 12, color: Color(0xff9999A3)), textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}