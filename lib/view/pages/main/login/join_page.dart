import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/login/components/custom_form.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/login/components/default_button.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/login/components/line_app_bar.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/login/components/line_button.dart';

class JoinPage extends StatelessWidget {
  const JoinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: LineAppBar(),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              SizedBox(height: 30),
              _buildEmailForm(),
              SizedBox(height: 24),
              CustomForm("닉네임", "닉네임을 입력해주세요"),
              SizedBox(height: 18),
              _buildPasswordForm(),
              SizedBox(height: 40),
              LineButton("회원가입", "/login"),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildEmailForm() {
    return Column(
      children: [
        CustomForm("이메일", "이메일을 입력해주세요"),
        SizedBox(height: 6),
        DefaultButton("인증하기", "/"),
      ],
    );
  }

  Column _buildPasswordForm() {
    return Column(
      children: [
        CustomForm("비밀번호", "비밀번호를 입력해주세요"),
        SizedBox(height: 6),
        TextFormField(
          decoration: InputDecoration(
              hintText: "비밀번호를 입력해주세요",
              contentPadding: const EdgeInsets.fromLTRB(10, 14, double.minPositive, 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Color.fromRGBO(233, 233, 233, 100),
                ),
              ),
              hintStyle: GoogleFonts.notoSans(
                color: const Color(0xffe2e2e2),
                textStyle: textTheme().headline2,
              )),
        )
      ],
    );
  }
}
