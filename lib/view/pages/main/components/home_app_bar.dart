import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/widgets/k_stack_icon.dart';

class HomeAppBar extends AppBar implements PreferredSizeWidget {
  HomeAppBar({super.key});

  @override
  bool get automaticallyImplyLeading => false;

  @override
  Widget? get title => Row(
        children: [
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                Text("안녕, ", style: TextStyle(color: Colors.white)),
                Text("Zne.vil ", style: TextStyle(color: Color(0xffFFD21D))),
                Text("님", style: TextStyle(color: Colors.white)),
                SizedBox(width: 4),
                Icon(CupertinoIcons.chevron_down, size: 14)
              ],
            ),
          ),
        ],
      );

  // @override
  // bool? get centerTitle => false;
  //
  @override
  List<Widget>? get actions => [
        Row(
          children: [
            KStackIcon(iconData: CupertinoIcons.bell, notificationCount: '9'),
            KStackIcon(iconData: CupertinoIcons.gear_big, notificationCount: '0'),
          ],
        ),
      ];
  //
  // @override
  // Widget? get leading => Text("dd");
  //
  // @override
  // //final Size preferredSize; // This didnot work for me.
  // Size get preferredSize => Size.fromHeight(55); //This should work.
  @override
  ShapeBorder? get shape => RoundedRectangleBorder(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10)),
      );
}
