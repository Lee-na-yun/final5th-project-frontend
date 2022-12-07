import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/models/follow.dart';
import 'package:riverpod_firestore_steam1/models/users.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/home/notice_page.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/widgets/k_stack_icon.dart';

import '../home/update_password_page.dart';

class HomeAppBar extends AppBar implements PreferredSizeWidget {
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
                      height: elevation,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 30,
                              width: 50,
                              child: Divider(height: 1, color: kchacholGreyColor(), thickness: 4),
                            ),
                            Container(
                              width: double.infinity,
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height / 2,
                                //어거지로 리스트뷰 높이 맞춤...
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  itemCount: userList.length,
                                  itemBuilder: (context, index) => _buildListItemsFREINDS(index),
                                ),
                              ),
                            )
                          ],
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
                    padding: const EdgeInsets.only(top: 4),
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
                  SizedBox(width: 4),
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Icon(CupertinoIcons.chevron_down, size: 14),
                  )
                ],
              )
            : Text("마이페이지"));
  }

  @override
  List<Widget>? get actions => [
        Container(
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/notice");
                },
                child: KStackIcon(iconData: CupertinoIcons.bell, notificationCount: '9'),
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
                    icon: Image.asset("assets/icon_setting_w2.png", width: 20),
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
  // //final Size preferredSize; // This didnot work for me.
  // Size get preferredSize => Size.fromHeight(55); //This should work.
  @override
  ShapeBorder? get shape => RoundedRectangleBorder(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10)),
      );

  Widget _buildListItemsFREINDS(int index) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        //난중에 키보드 자판 생기면 해당 컬럼 짜그라치는 코드
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(image: AssetImage("${userList[index].profileImg}"), fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      width: 175,
                      child: Text.rich(
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        TextSpan(
                          //text: 'Hello ',
                          children: <TextSpan>[
                            TextSpan(text: '${userList[index].sender}', style: textTheme(color: kPrimaryColor(), weight: FontWeight.bold).headline3),
                            TextSpan(
                              text: '님이 회원님을 팔로우하기 시작했습니다.시작했습니다.시작했습니다.',
                              style: textTheme(color: kPrimaryColor()).headline3,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //_buildFollowBtn("follow"),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: klightGreyColor(),
              thickness: 1.5,
            ),
          ],
        ),
      ),
    );
  }
}
