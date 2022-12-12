import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import '../../../models/test/todo.dart';
import 'components/default_button.dart';
import 'login/components/line_button.dart';
import 'mypage/mypage_main_page.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/chat/chat_page.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/home/my_home_page.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/search/search_page.dart';

import 'chat/chat_page.dart';
import 'home/my_home_page.dart';
import 'mypage/mypage_main_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          MyHomePage(),
          ChatPage(),
          Center(child: Text("작성")),
          SearchPage(),
          MyPageMainPage(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      //height: 55,
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xffe2e2e2), width: 1.0)),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        iconSize: 20.0,
        //unselectedFontSize: 10.0,
        //selectedFontSize: 10.0,
        selectedLabelStyle: textTheme().bodyText2,
        unselectedLabelStyle: textTheme().bodyText2,
        currentIndex: _selectedIndex,
        backgroundColor: Colors.white,
        selectedItemColor: theme().primaryColor,
        unselectedItemColor: Color(0xff9999A3),
        onTap: (index) {
          index == 2
              ? _writeForm()
              : setState(() {
                  _selectedIndex = index;
                });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("assets/home.png", width: 20, height: 20),
            activeIcon: Image.asset("assets/home_selected.png"),
            label: "홈",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/chat.png", width: 20, height: 20),
            activeIcon: Image.asset("assets/chat_selected.png"),
            label: "채팅",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/write.png", width: 20, height: 20),
            activeIcon: Image.asset("assets/write_selected.png"),
            label: "글쓰기",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/search.png", width: 20, height: 20),
            activeIcon: Image.asset("assets/search_selected.png"),
            label: "검색",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/my.png", width: 20, height: 20),
            activeIcon: Image.asset("assets/my_selected.png"),
            label: "MY",
          ),
        ],
      ),
    );
  }

  Future<dynamic> _writeForm() {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            //위 패딩은 모달창의 터치 가능한 영역 내부 패딩
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: Colors.white,
            ),
            child: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 30, width: 50, child: Divider(height: 1, color: kchacholGreyColor(), thickness: 4)),
                  Text(" "),
                  Row(),
                  _buildMinToDoWrite(),
                  SizedBox(
                    width: 320,
                    height: 40,
                    child: LineButton("스케줄 만들기", "/write_form"),
                  ),
                  SizedBox(
                    height: 25,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMinToDoWrite() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 7),
              child: ConstrainedBox(
                //입력 만큼 height 늘어나려면 얘로 감싸고 1
                constraints: const BoxConstraints(maxHeight: 300), //얘를 주면 됨 2
                child: TextField(
                  controller: _textController,
                  style: textTheme().headline3,
                  maxLines: null, //이걸 NULL 로 해주고 3
                  maxLength: 50,
                  decoration: const InputDecoration(
                      hintText: "할 일 작성",
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                      focusColor: Colors.black),
                  onSubmitted: _handleSubmitted,
                ),
              ),
            ),
          ),
          Container(
              //decoration: BoxDecoration(),
              width: 48,
              height: 27,
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  _handleSubmitted(_textController.text);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  elevation: 0.0,
                ),
                child: Text(
                  "입력",
                  style: textTheme().headline3,
                ),
              ))
        ],
      ),
    );
  }

  void _handleSubmitted(text) {
    _textController.clear();
    print(text);

    setState(() {
      globalToDoItems.add(ToDo(
        content: text,
        time: DateFormat("a K:m").format(new DateTime.now()),
        date: 08,
        day: "Mon",
        done: false,
      ));
    });
  }
}
