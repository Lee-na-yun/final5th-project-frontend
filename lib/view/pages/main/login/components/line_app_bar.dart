import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';

class LineAppBar extends StatelessWidget {
  const LineAppBar(
    this.title, {
    Key? key,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new),
        onPressed: () {
          Navigator.pop(context);
        },
        color: Color(0xff1C1C1C),
      ),
      titleSpacing: 0,
      title: Text(
        "${title}",
        style: textTheme().headline2,
      ),
      backgroundColor: Colors.white,
      shape: Border(
        bottom: BorderSide(width: 1, style: BorderStyle.solid, color: Color(0xfff2f2f2)),
      ),
    );
  }
}
