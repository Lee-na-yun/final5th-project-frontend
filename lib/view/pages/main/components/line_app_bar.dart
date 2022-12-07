import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';

class LineAppBar extends StatelessWidget {
  const LineAppBar(
    this.title,
    this.actionImg, {
    Key? key,
  }) : super(key: key);
  final String title;
  final String? actionImg;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(bottom: 2),
        child: IconButton(
          icon: Image.asset("assets/icon_arrow_back.png", width: 10),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Color(0xff1C1C1C),
        ),
      ),
      titleSpacing: 0,
      title: Text(
        "${title}",
        style: textTheme(color: kPrimaryColor(), weight: FontWeight.bold).headline2,
      ),
      backgroundColor: Colors.white,
      shape: Border(
        bottom: BorderSide(width: 1, style: BorderStyle.solid, color: Color(0xfff2f2f2)),
      ),
      actions: [
        actionImg != null
            ? Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset("assets/icon_search.png", width: 18),
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                  ),
                  SizedBox(width: 14),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset("assets/icon_menu.png", width: 20),
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                  ),
                  SizedBox(width: 20),
                ],
              )
            : Text(""),
      ],
    );
  }
}
