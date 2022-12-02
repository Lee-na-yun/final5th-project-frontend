import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';

class BoardAppBarV2 extends AppBar implements PreferredSizeWidget {
  BoardAppBarV2({super.key, required this.titlename});
  final String? titlename;

  @override
  bool get automaticallyImplyLeading => false;

  @override
  Color? get backgroundColor => Colors.white;

  @override
  Widget? get leading => InkWell(
        onTap: () {
          return;
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Icon(Icons.arrow_back_ios_new, color: kPrimaryColor()),
            ],
          ),
        ),
      );

  @override
  Widget? get title => Text(
        "${titlename}",
        style: textTheme(color: kPrimaryColor(), weight: FontWeight.bold).headline2,
      );

  @override
  List<Widget>? get actions => [
        IconButton(
          onPressed: () {},
          icon: Image.asset("assets/notice_black.png", width: 20, height: 20),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
        const SizedBox(width: 14),
        IconButton(
          onPressed: () {},
          icon: Image.asset("assets/setting_black.png", width: 20, height: 20),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
        const SizedBox(width: 20),
      ];

  // @override
  // ShapeBorder? get shape => RoundedRectangleBorder(
  //       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10)),
  //     );

  @override
  //final Size preferredSize; // This didnot work for me.
  Size get preferredSize => const Size.fromHeight(55); //This should work.
}
