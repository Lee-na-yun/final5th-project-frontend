import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/core/util/validator_util.dart';
import 'package:riverpod_firestore_steam1/view/components/default_button.dart';
import 'package:riverpod_firestore_steam1/view/components/line_app_bar.dart';
import 'package:riverpod_firestore_steam1/view/pages/login/components/custom_password_form.dart';

class UpdatePasswordPage extends StatelessWidget {
  UpdatePasswordPage({Key? key}) : super(key: key);

  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: LineAppBar("비밀번호 변경", null),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(height: 30),
            _buildPasswordForm(),
            SizedBox(height: 24),
            DefaultButton(btnText: "확인", routes: "/home"),
          ],
        ),
      ),
    );
  }

  Column _buildPasswordForm() {
    return Column(
      children: [
        CustomPasswordForm(
          "비밀번호",
          "비밀번호를 입력해주세요",
          funValidator: validatePassword(),
          controllerInput: _password,
        ),
        SizedBox(height: 6),
        TextFormField(
          decoration: InputDecoration(
              hintText: "비밀번호를 입력해주세요",
              contentPadding:
                  const EdgeInsets.fromLTRB(10, 14, double.minPositive, 14),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: kmidGreyColor(),
                ),
              ),
              hintStyle:
                  textTheme(color: kmidGreyColor(), weight: FontWeight.bold)
                      .headline3),
          obscureText: true,
        )
      ],
    );
  }
}
