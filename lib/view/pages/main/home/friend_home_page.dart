import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/home/update_password_page.dart';

import '../../../../models/test/todo.dart';
import '../../../../models/test/users.dart';
import '../components/home_app_bar.dart';
import '../components/home_app_bar_friend.dart';
import 'home_page_top.dart';

List<ToDo> globalToDoItems = List.of(ToDoList);

class FriendHomePage extends StatefulWidget {
  FriendHomePage({Key? key}) : super(key: key);
  final List<User> userList = List.of(users);

  @override
  State<FriendHomePage> createState() => _FriendHomePageState();
}

class _FriendHomePageState extends State<FriendHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBarFriend("친구", context: context),
      body: _homeBody(),
      endDrawer: _drawer(context),
      endDrawerEnableOpenDragGesture: false,
      drawerEnableOpenDragGesture: false,
    );
  }

  Widget _homeBody() {
    return Column(
      children: [
        //Container(height: 320, child: HomePageTop()),
        Expanded(
          child: CustomScrollView(
            slivers: <Widget>[
              _buildHomeTop(),
              _buildToDoLists(),
            ],
          ),
        ),
      ],
    );
  }

  SliverFixedExtentList _buildToDoLists() {
    return SliverFixedExtentList(
      itemExtent: 58.0,
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
          alignment: Alignment.center,
          child: _ToDoList(index),
        );
      }, childCount: globalToDoItems.length),
    );
  }

  SliverAppBar _buildHomeTop() {
    return SliverAppBar(
      stretch: false,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      pinned: false,
      expandedHeight: 440.0,
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1,
        titlePadding: EdgeInsets.only(left: 20),
        title: Container(
          alignment: Alignment.centerLeft,
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(color: Colors.white),
          child: Text(
            "오늘 할 일",
            textAlign: TextAlign.center,
            style: GoogleFonts.notoSans(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
        background: HomePageTop(),
      ),
    );
  }

  Widget _drawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
              height: 55,
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 2, right: 14),
                    child: SizedBox(
                      width: 12,
                      height: 12,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        padding: EdgeInsets.zero,
                        icon: SvgPicture.asset("assets/icon_close.svg", width: 12, height: 12),
                      ),
                    ),
                  ),
                  Text(
                    "설정",
                    style: textTheme(color: kPrimaryColor(), weight: FontWeight.bold).headline2,
                  )
                ],
              )),
          Container(
            height: 62,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/img_banner.png'),
              ),
            ),
          ),
          _buildMenuList(text: "화면", fontColor: kPrimaryColor()),
          _buildMenuList(text: "알림", fontColor: kPrimaryColor()),
          _buildMenuList(text: "구독/결제", fontColor: kPrimaryColor()),
          _buildMenuList(text: "친구초대", fontColor: kPrimaryColor()),
          _buildMenuList(text: "비밀번호 변경", fontColor: kPrimaryColor()),
          _buildMenuList(text: "고객센터", fontColor: kPrimaryColor()),
          _buildMenuList(text: "버전", fontColor: kPrimaryColor()),
          _buildMenuList(
            text: "로그아웃",
            fontColor: kchacholGreyColor(),
          ),
        ],
      ),
    );
  }

  ListTile _buildMenuList({required String text, Color? fontColor, FontWeight? fontWeight}) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20),
      title: Text(text, style: textTheme(color: fontColor, weight: fontWeight).headline3),
      trailing: text != "로그아웃" ? SvgPicture.asset("assets/icon_arrow_next.svg", width: 8) : null,
      onTap: () {
        text == "비밀번호 변경"
            ? Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UpdatePasswordPage()),
              )
            : null;
      },
      shape: Border(bottom: BorderSide(color: klightGreyColor(), width: 1.5)),
    );
  }

  Widget _ToDoList(int index) {
    return Slidable(
      key: Key(globalToDoItems[index].content),
      endActionPane: ActionPane(
        extentRatio: 0.25,
        motion: const ScrollMotion(),
        // dismissible: DismissiblePane(onDismissed: () {
        //   setState(() {
        //     globalToDoItems.remove(globalToDoItems[index]);
        //   });
        // }),
        children: [
          SlidableAction(
            onPressed: (context) {
              setState(() {
                _removeToDoItem(context, index);
              });
            },
            foregroundColor: primary,
            icon: CupertinoIcons.trash,
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 4),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Container(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  //height: 60,
                  //padding: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                  decoration: BoxDecoration(
                    color: klightGreyColor(),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        //width: 10,
                        padding: EdgeInsets.only(top: 4),
                        child: Checkbox(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          value: globalToDoItems[index].done,
                          onChanged: (value) {
                            setState(() {
                              globalToDoItems[index].done = value;
                            });
                          },
                        ),
                      ),
                      //SizedBox(width: 14),
                      Text(
                        globalToDoItems[index].content,
                        style: globalToDoItems[index].done == true
                            ? TextStyle(decoration: TextDecoration.lineThrough, fontSize: 16, height: 1.2, color: kchacholGreyColor())
                            : textTheme().headline3,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _removeToDoItem(BuildContext context, int index) {
  print("클릭됨");
  globalToDoItems.remove(globalToDoItems[index]);
}
