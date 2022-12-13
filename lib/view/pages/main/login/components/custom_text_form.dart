import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;

  final funValidator;

  final controller;

  const CustomTextFormField({
    required this.hint,
    required this.funValidator,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: controller,
        validator: funValidator,
        obscureText: hint == "Password" ? true : false,
        decoration: InputDecoration(
            hintText: "${hint}",
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
    );
  }
}
