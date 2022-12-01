import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/login/components/custom_form.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/login/components/custom_password_form.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/login/components/line_app_bar.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/login/components/line_button.dart';

class JoinPage extends StatelessWidget {
  const JoinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: LineAppBar("이메일 간편가입"),
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
    );
  }

  Widget _buildEmailForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "이메일",
          style: textTheme(color: kchacholGreyColor(), weight: FontWeight.w700).bodyText1,
        ),
        SizedBox(height: 2),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 7,
              child: Container(
                //width: 222,
                //color: Colors.blue,
                padding: EdgeInsets.only(top: 2),
                child: TextFormField(
                  decoration: new InputDecoration(
                    hintText: "이메일을 입력해주세요",
                    contentPadding: EdgeInsets.only(top: 12, bottom: 12, left: 10),
                    isDense: true,
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(
                        color: Color(0xffe2e2e2),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintStyle: textTheme(color: kmidGreyColor(), weight: FontWeight.bold).headline2,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                //color: Colors.green,
                padding: EdgeInsets.only(left: 6),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(color: Colors.white),
                      padding: EdgeInsets.only(left: 20, right: 20, top: 14, bottom: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0.0),
                  child: Text(
                    "인증하기",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Column _buildPasswordForm() {
    return Column(
      children: [
        CustomPasswordForm("비밀번호", "비밀번호를 입력해주세요"),
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
            hintStyle: textTheme(color: kmidGreyColor(), weight: FontWeight.bold).headline2,
          ),
          obscureText: true,
        )
      ],
    );
  }
}
