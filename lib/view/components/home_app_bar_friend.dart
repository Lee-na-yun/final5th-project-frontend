import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/core/util/constant/move.dart';
import 'package:riverpod_firestore_steam1/models/test/users.dart';
import 'package:riverpod_firestore_steam1/view/pages/widget/friends_radio.dart';

class HomeAppBarFriend extends AppBar implements PreferredSizeWidget {
  final mContext = navigatorKey.currentContext;
  var index;

  HomeAppBarFriend(this.username, {super.key, required this.context});
  final BuildContext context;

  final String? username;
  final List<User> userList = List.of(users);

  @override
  bool get automaticallyImplyLeading => false;

  @override
  Widget? get leading => IconButton(
        color: Colors.white,
        onPressed: () {
          Navigator.pop(mContext!);
        },
        icon: Icon(Icons.arrow_back),
      );

  @override
  // TODO: implement backgroundColor
  Color? get backgroundColor => primary;

  Widget _homePage(String? username) {
    return Container(
        child: username != null
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "",
                    style: GoogleFonts.notoSans(
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Text(
                      username,
                      style: GoogleFonts.notoSans(
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffFFD21D),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "님의 스케줄",
                    style: GoogleFonts.notoSans(
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 4),
                    child: SvgPicture.asset("assets/icon_arrow_bottom_w.svg",
                        width: 14),
                  ),
                ],
              )
            : Text(
                "마이페이지",
                style: GoogleFonts.notoSans(
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ));
  }

  @override
  List<Widget>? get actions => [
        InkWell(
          onTap: () {
            Logger().d(
                "fdsafdfsdafsadfdsafsdafsadfsdafsadfsafsadfsa----------------");
            Navigator.pushReplacementNamed(context, Move.chatListPage);
          },
          child: Row(
            children: [
              SvgPicture.asset("assets/icon_send_w.svg", width: 19),
              SizedBox(width: 20),
            ],
          ),
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
