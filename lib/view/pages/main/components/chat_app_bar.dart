import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatAppBar extends AppBar implements PreferredSizeWidget {
  ChatAppBar({super.key});

  @override
  bool get automaticallyImplyLeading => false;

  @override
  Color? get backgroundColor => Colors.white;

  @override
  Widget? get title => Text(
        "채팅",
        style: GoogleFonts.notoSans(
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xff1C1C1C),
          ),
        ),
      );

  @override
  List<Widget>? get actions => [
        IconButton(
          onPressed: () {},
          icon: Image.asset("assets/notice_black.png", width: 20, height: 20),
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
        ),
        SizedBox(width: 14),
        IconButton(
          onPressed: () {},
          icon: Image.asset("assets/setting_black.png", width: 20, height: 20),
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
        ),
        SizedBox(width: 20),
      ];

  @override
  PreferredSizeWidget? get bottom => PreferredSize(
        child: Divider(thickness: 2, color: Color(0xfff2f2f2), height: 1),
        preferredSize: preferredSize,
      );

  @override
  //final Size preferredSize; // This didnot work for me.
  Size get preferredSize => Size.fromHeight(55); //This should work.
}
