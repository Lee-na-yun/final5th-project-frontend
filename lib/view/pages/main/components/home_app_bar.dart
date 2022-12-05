import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/models/follow.dart';
import 'package:riverpod_firestore_steam1/models/users.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/home/notice_page.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/widgets/k_stack_icon.dart';

class HomeAppBar extends AppBar implements PreferredSizeWidget {
  HomeAppBar(this.username, {super.key, required this.context});
  final BuildContext context;

  final String? username;

  @override
  bool get automaticallyImplyLeading => false;

  @override
  Widget? get title => Row(
        children: [
          InkWell(
            onTap: () {},
            child: _homePage(username),
          ),
        ],
      );

  Widget _homePage(String? username) {
    return Container(
        child: username != null
            ? Row(
                children: [
                  Text("안녕, ", style: TextStyle(color: Colors.white)),
                  Text(username, style: TextStyle(color: Color(0xffFFD21D))),
                  Text("님:)", style: TextStyle(color: Colors.white)),
                  SizedBox(width: 4),
                  Icon(CupertinoIcons.chevron_down, size: 14)
                ],
              )
            : Text("마이페이지"));
  }

  // @override
  // bool? get centerTitle => false;
  //
  @override
  List<Widget>? get actions => [
        Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/notice");
              },
              child: KStackIcon(iconData: CupertinoIcons.bell, notificationCount: '9'),
            ),
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
