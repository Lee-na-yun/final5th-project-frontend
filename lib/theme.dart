import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

TextTheme textTheme() {
  return TextTheme(
    headline1: GoogleFonts.openSans(fontSize: 18.0, color: Colors.black),
    headline2: GoogleFonts.openSans(
        fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
    bodyText1: GoogleFonts.openSans(fontSize: 16.0, color: Colors.black),
    bodyText2: GoogleFonts.openSans(fontSize: 14.0, color: Colors.grey),
    subtitle1: GoogleFonts.openSans(fontSize: 15.0, color: Colors.black),
  );
}

// 기존 코드

// AppBarTheme appTheme() {

//   return AppBarTheme(

//     centerTitle: false,

//     color: Colors.white,

//     elevation: 0.0,

//     textTheme: TextTheme(

//       headline6: GoogleFonts.nanumGothic(

//         fontSize: 16,

//         fontWeight: FontWeight.bold,

//         color: Colors.black,

//       ),

//     ),

//   );

// }

// 기존 코드 수정

AppBarTheme appTheme() {
  return AppBarTheme(
    centerTitle: false,
    color: Colors.white,
    elevation: 0.0,
    titleTextStyle: textTheme().headline6,
  );
}

ThemeData theme() {
  return ThemeData(
    //primarySwatch: Colors.purpleAccent,
    scaffoldBackgroundColor: Colors.white,
    textTheme: textTheme(),
    appBarTheme: appTheme(),
  );
}
