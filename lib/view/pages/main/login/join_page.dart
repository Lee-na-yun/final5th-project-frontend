import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_firestore_steam1/contoller/user_controller.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/core/util/validator_util.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/login/components/custom_elevated_button.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/login/components/custom_form.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/login/components/custom_password_form.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/login/components/line_button.dart';

import '../../../../core/util/constant/move.dart';
import '../components/line_app_bar.dart';
import 'components/custom_text_form.dart';

class JoinPage extends ConsumerWidget {
  JoinPage({Key? key}) : super(key: key);
  //컴포넌트화에 조금더 심혈을 기울어야 했음 완전 뒤죽박죽
  final pwVali = validatePassword();
  final emailVali = validateEmail();

  final _formKey = GlobalKey<FormState>();

  //입력된 값 정리 해주기 위해서
  final _password1 = TextEditingController(); // 추가
  final _password2 = TextEditingController(); // 추가
  final _email = TextEditingController(); // 추가
  final _nickname = TextEditingController(); // 추가

  @override
  Widget build(BuildContext contextm, WidgetRef _ref) {
    final uContrl = _ref.read(userController);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: LineAppBar("이메일 간편가입", null),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: _buildJoinForm(uContrl),
      ),
    );
  }

  Form _buildJoinForm(UserController uContrl) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          SizedBox(height: 30),
          _buildEmailForm(
            emailVali,
            _email,
          ),
          SizedBox(height: 24),
          CustomForm(
            "닉네임",
            "닉네임을 입력해주세요",
            funValidator: validateNickname(),
            controllerInput: _nickname,
          ),
          SizedBox(height: 18),
          _buildPasswordForm(pwVali, _password1, _password2),
          SizedBox(height: 40),
          CustomElevatedButton(
              text: "회원가입 완료",
              funPageRoute: () async {
                if (_formKey.currentState!.validate()) {
                  // 추가
                  uContrl.join(
                    username: _email.text.trim(),
                    password: _password1.text.trim(),
                    email: _email.text.trim(),
                  );
                }
              }),
          SizedBox(height: 20),
          LineButton("로그인 페이지로 이동", Move.loginPage)
        ],
      ),
    );
  }

  Widget _buildEmailForm(emailValidate, _controllerInput) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "이메일",
          style: textTheme(color: kchacholGreyColor(), weight: FontWeight.w700)
              .bodyText1,
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
                  controller: _controllerInput,
                  validator: emailValidate,
                  decoration: InputDecoration(
                    hintText: "이메일을 입력해주세요",
                    contentPadding:
                        EdgeInsets.only(top: 12, bottom: 12, left: 10),
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: kmidGreyColor(),
                      ),
                    ),
                    hintStyle: textTheme(
                            color: kmidGreyColor(), weight: FontWeight.bold)
                        .headline2,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                //color: Colors.green,
                padding: EdgeInsets.only(left: 6, top: 1),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(color: Colors.white),
                      padding: EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 17),
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

  Column _buildPasswordForm(pwValidate, _controllerInput1, _controllerInput2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "비밀번호",
          style: textTheme(color: kchacholGreyColor(), weight: FontWeight.w700).bodyText1,
        ),
        SizedBox(height: 2),
        TextFormField(
          controller: _controllerInput1,
          validator: pwValidate,
          decoration: InputDecoration(
              hintText: "비밀번호를 입력해 주세요",
              contentPadding: const EdgeInsets.fromLTRB(10, 14, double.minPositive, 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: kmidGreyColor(), width: 1.0),
              ),
              hintStyle: textTheme(color: kmidGreyColor(), weight: FontWeight.bold).headline2),
          obscureText: true,
        ),
        SizedBox(height: 6),
        TextFormField(
          controller: _controllerInput2,
          validator: (value) {
            if (value!.isEmpty) {
              return "비밀번호를 재 입력해 주세요";
            } else if (_password1.text != _password2.text) {
              return "두 비밀번호가 일치하지 않습니다";
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: "비밀번호를 입력해주세요",
            contentPadding: const EdgeInsets.fromLTRB(10, 14, double.minPositive, 14),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: kmidGreyColor(),
              ),
            ),
            hintStyle:
                textTheme(color: kmidGreyColor(), weight: FontWeight.bold)
                    .headline2,
          ),
          obscureText: true,
        )
      ],
    );
  }
}
