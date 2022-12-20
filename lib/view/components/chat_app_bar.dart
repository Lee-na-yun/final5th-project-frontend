import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/core/util/constant/move.dart';

class ChatAppBar extends AppBar implements PreferredSizeWidget {
  final mContext = navigatorKey.currentContext;
  ChatAppBar({super.key});

  @override
  bool get automaticallyImplyLeading => false;

  @override
  Widget? get leading => IconButton(
        color: Colors.black,
        onPressed: () {
          Navigator.pop(mContext!);
        },
        icon: Icon(Icons.arrow_back),
      );

  @override
  Color? get backgroundColor => Colors.white;

  @override
  Widget? get title => Text(
        "채팅",
        style: textTheme(color: kPrimaryColor(), weight: FontWeight.bold)
            .headline2,
      );

  @override
  List<Widget>? get actions => [
        IconButton(
          onPressed: () {},
          icon:
              SvgPicture.asset("assets/icon_notice.svg", width: 20, height: 20),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
        const SizedBox(width: 14),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icon_setting.svg",
              width: 20, height: 20),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
        const SizedBox(width: 20),
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
