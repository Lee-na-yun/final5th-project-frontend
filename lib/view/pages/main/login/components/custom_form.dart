import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';

class CustomForm extends StatelessWidget {
  const CustomForm(this.text, this.hintText, {Key? key}) : super(key: key);
  final String text;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${text}",
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.w700,
            color: klightGreyColor(),
            textStyle: textTheme().bodyText1,
          ),
        ),
        SizedBox(height: 2),
        TextFormField(
          decoration: InputDecoration(
              hintText: "${hintText}",
              contentPadding: EdgeInsets.only(top: 12, bottom: 12, left: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Color.fromRGBO(233, 233, 233, 100),
                ),
              ),
              hintStyle: GoogleFonts.notoSans(
                color: Color(0xffe2e2e2),
                textStyle: textTheme().headline2,
              )),
        ),
      ],
    );
  }
}
