import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';

class BoardAppBar extends StatelessWidget {
  const BoardAppBar(
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
        style: textTheme(color: kPrimaryColor(), weight: FontWeight.bold).headline2,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Image.asset("assets/notice.png", width: 20, height: 20),
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
        ),
        SizedBox(width: 14),
        IconButton(
          onPressed: () {},
          icon: Image.asset("assets/setting.png", width: 20, height: 20),
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
        ),
        SizedBox(width: 20),
      ],
      backgroundColor: Colors.white,
      shape: Border(
        bottom: BorderSide(width: 1, style: BorderStyle.solid, color: Color(0xfff2f2f2)),
      ),
    );
  }
}
