import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPageAppBar extends AppBar implements PreferredSizeWidget {
  MyPageAppBar({super.key});

  @override
  bool get automaticallyImplyLeading => false;

  // @override
  // Color? get backgroundColor => Colors.white;

  @override
  Widget? get title => Text(
        "마이페이지",
        style: GoogleFonts.notoSans(
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      );

  @override
  List<Widget>? get actions => [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icon_notice_w.svg",
              width: 20, height: 20),
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
        ),
        SizedBox(width: 14),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icon_setting.svg",
              width: 20, height: 20),
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
        ),
        SizedBox(width: 20),
      ];

  @override
  ShapeBorder? get shape => RoundedRectangleBorder(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10)),
      );

  @override
  //final Size preferredSize; // This didnot work for me.
  Size get preferredSize => Size.fromHeight(55); //This should work.
}
