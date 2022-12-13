import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';

class CustomPasswordForm extends StatelessWidget {
  const CustomPasswordForm(this.text, this.hintText, {required this.controllerInput, required this.funValidator, Key? key}) : super(key: key);
  final String text;
  //텍스트 필드 난무..
  final funValidator;
  final controllerInput;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${text}",
          style: textTheme(color: kchacholGreyColor(), weight: FontWeight.w700).bodyText1,
        ),
        SizedBox(height: 4),
        TextFormField(
          controller: controllerInput,

          validator: funValidator,
          decoration: InputDecoration(
              hintText: "${hintText}",
              contentPadding: const EdgeInsets.fromLTRB(14, 14, double.minPositive, 14),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: kmidGreyColor(),
                ),
              ),
              hintStyle: textTheme(color: kmidGreyColor(), weight: FontWeight.bold).headline3),
          obscureText: true,
        ),
      ],
    );
  }
}
