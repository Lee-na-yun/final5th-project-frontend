import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/core/util/constant/move.dart';
import 'package:riverpod_firestore_steam1/models/test/users.dart';
import 'package:riverpod_firestore_steam1/view/pages/widget/friends_radio.dart';
import 'package:riverpod_firestore_steam1/view/pages/widget/k_stack_icon.dart';

class HomeAppBar extends AppBar implements PreferredSizeWidget {
  var index;

  HomeAppBar(this.username, {super.key, required this.context});
  final BuildContext context;

  final String? username;
  final List<User> userList = List.of(users);

  @override
  bool get automaticallyImplyLeading => false;

  @override
  Widget? get title => Row(
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      //위 패딩은 모달창의 터치 가능한 영역 내부 패딩
                      //height: elevation,
                      height: 320,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 18),
                          child: Column(
                            children: <Widget>[
                              // SizedBox(
                              //   height: 30,
                              //   width: 50,
                              //   child: Divider(
                              //       height: 1,
                              //       color: kchacholGreyColor(),
                              //       thickness: 4),
                              // ),
                              Container(
                                width: 50,
                                height: 4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: kmidGreyColor(),
                                ),
                                margin: EdgeInsets.only(bottom: 20),
                              ),
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  child: SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 2,

                                    //어거지로 리스트뷰 높이 맞춤...
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      padding: EdgeInsets.zero,
                                      itemCount: userList.length,
                                      itemBuilder: (context, index) =>
                                          FriendsRadio(
                                        userList.length,
                                        user: User(
                                          sender: userList[index].sender,
                                          message: userList[index].message,
                                          profileImg:
                                              userList[index].profileImg,
                                          sendDate: userList[index].sendDate,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            },
            child: _homePage(username),
          ),
        ],
      );

  Widget _homePage(String? username) {
    return Container(
        child: username != null
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "안녕, ",
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
                    "님:)",
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
        Container(
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Move.noticePage);
                },
                child: KStackIcon(
                    iconData: CupertinoIcons.bell, notificationCount: '3'),
              ),
              SizedBox(width: 10),
              Builder(builder: (context) {
                return Container(
                  width: 20,
                  height: 20,
                  child: IconButton(
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    padding: EdgeInsets.zero,
                    icon: SvgPicture.asset("assets/icon_setting_w2.svg",
                        width: 20),
                  ),
                );
              }),
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
  // //final Size preferredSize; // This didnot work for me.3
  // Size get preferredSize => Size.fromHeight(55); //This should work.
  @override
  ShapeBorder? get shape => RoundedRectangleBorder(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10)),
      );
}
