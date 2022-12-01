import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/chat/chat_page.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/home/my_home_page.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/mypage/mypage_main_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          MyHomePage(),
          ChatPage(),
          Center(child: Text("WritePage")),
          Center(child: Text("SearchPage")),
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
          setState(() {
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
}
