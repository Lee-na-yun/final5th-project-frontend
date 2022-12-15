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
import '../../../../provider/auth_provider.dart';
import '../components/default_button.dart';

class LoginPage extends ConsumerWidget {
  final _formkey = GlobalKey<FormState>();
  final _username = TextEditingController(); // 추가
  final _password = TextEditingController(); // 추가

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(authProvider.notifier).autoLogin();
    UserController uContrl = ref.read(userController);
    return Scaffold(
      body: _buildLoginPage(context, uContrl),
    );
  }

  Padding _buildLoginPage(BuildContext context, uContrl) {
    return Padding(
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
          _joinForm(context, uContrl),
        ],
      ),
    );
  }

  Widget _joinForm(BuildContext context, UserController uC) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          SizedBox(height: 70),
          CustomForm(
            "이메일",
            "이메일을 입력해주세요",
            funValidator: validateUsername(),
            controllerInput: _username,
          ),
          SizedBox(height: 18),
          CustomPasswordForm(
            "비밀번호",
            "비밀번호를 입력해주세요",
            funValidator: validatePassword(),
            controllerInput: _password,
          ),
          SizedBox(height: 40),
          CustomElevatedButton(
              text: "로그인",
              funPageRoute: () async {
                if (_formkey.currentState!.validate()) {
                  // 추가
                  uC.login(username: _username.text.trim(), password: _password.text.trim());
                }
              }),
          SizedBox(height: 14),
          LineButton("회원가입", Move.joinPage),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, Move.findPassword);
            },
            child: Text(
              "비밀번호 찾기",
              style: textTheme(color: kchacholGreyColor()).bodyText1,
              textAlign: TextAlign.center,
            ),
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }
}
