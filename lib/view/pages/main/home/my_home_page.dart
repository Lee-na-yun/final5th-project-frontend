import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/components/home_app_bar.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/home/home_page_top.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/home/update_password_page.dart';

import '../../../../models/todo.dart';

List<ToDo> globalToDoItems = List.of(ToDoList);

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool? _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar("Zne.vil", context: context),
      body: _homeBody(),
      endDrawer: drawer(context),
    );
  }

  Widget _homeBody() {
    return Column(
      children: [
        //Container(height: 320, child: HomePageTop()),
        Expanded(
          child: CustomScrollView(
            slivers: <Widget>[
              const SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                pinned: true,
                expandedHeight: 380.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: HomePageTop(),
                ),
              ),
              SliverFixedExtentList(
                itemExtent: 50.0,
                delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    child: _ToDoList(index),
                  );
                }, childCount: globalToDoItems.length),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget drawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
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
                          Navigator.pop(context);
                        },
                        padding: EdgeInsets.zero,
                        icon: Image.asset("assets/icon_close.png", width: 12, height: 12),
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
          _buildMenuList(text: "로그아웃", fontColor: kchacholGreyColor(), fontWeight: FontWeight.bold),
        ],
      ),
    );
  }

  ListTile _buildMenuList({required String text, Color? fontColor, FontWeight? fontWeight}) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20),
      title: Text(text, style: textTheme(color: fontColor, weight: fontWeight).headline3),
      trailing: text != "로그아웃" ? Image.asset("assets/icon_arrow_next.png", width: 8) : null,
      onTap: () {},
      shape: Border(bottom: BorderSide(color: klightGreyColor(), width: 1.5)),
    );
  }

  Widget _ToDoList(int index) {
    return Slidable(
      key: Key(globalToDoItems[index].content),
      endActionPane: ActionPane(
        extentRatio: 0.25,
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () {
          setState(() {
            globalToDoItems.remove(globalToDoItems[index]);
          });
        }),
        children: [
          SlidableAction(
            onPressed: (context) {
              setState(() {
                printSome(context, index);
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
          //crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                height: 48,
                padding: EdgeInsets.symmetric(horizontal: 18),
                decoration: BoxDecoration(
                  color: klightGreyColor(),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 10,
                      child: Checkbox(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        value: globalToDoItems[index].done,
                        onChanged: (value) {
                          setState(() {
                            globalToDoItems[index].done = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 15),
                    Text(
                      globalToDoItems[index].content,
                      style: globalToDoItems[index].done == true
                          ? TextStyle(decoration: TextDecoration.lineThrough, fontSize: 14, color: kchacholGreyColor())
                          : textTheme().headline3,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void printSome(BuildContext context, int index) {
  print("클릭됨");
  globalToDoItems.remove(globalToDoItems[index]);
}
