import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';

class CustomForm extends StatelessWidget {
  const CustomForm(this.text, this.hintText, {required this.controllerInput, required this.funValidator, Key? key})
      : super(key: key);
  final String text;
  final funValidator;
  final String hintText;
  final controllerInput;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${text}",
          style: textTheme(color: kchacholGreyColor(), weight: FontWeight.w700)
              .bodyText1,
        ),
        SizedBox(height: 4),
        TextFormField(
          controller: controllerInput,
          validator: funValidator,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: kmidGreyColor(),
                ),
              ),
              hintText: "${hintText}",
              contentPadding: EdgeInsets.only(top: 12, bottom: 12, left: 14),
              hintStyle: GoogleFonts.notoSans(
                color: Color(0xffe2e2e2),
                textStyle: textTheme(weight: FontWeight.bold).headline3,
              )),
        ),
      ],
    );
  }
}
