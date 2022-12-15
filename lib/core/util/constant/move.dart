import 'package:flutter/cupertino.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/chat/chat_page.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/chat/chat_room_page.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/chat/chat_test_room_list_page.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/home/friend_home_page.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/home/notice_page.dart';

import '../../../view/pages/main/login/find_password_page.dart';
import '../../../view/pages/main/login/join_page.dart';
import '../../../view/pages/main/login/login_page.dart';
import '../../../view/pages/main/main_page.dart';
import '../../../view/pages/main/mypage/mypage_main_page.dart';
import '../../../view/pages/schedule/write_schedule_page.dart';

class Move {
  static String homePage = "/home";
  static String friendPage = "/friendPage";
  static String loginPage = "/login";
  static String findPassword = "/findPassword";
  //수정필요 API 컨트롤러 문서 보고 작성할 것
  static String joinPage = "/join";
  static String myPage = "/myPage";
  static String writePage = "/write";
  static String chatPage = "/chat";
  static String noticePage = "/notice";
  static String chatRoomPageTest = "/roomtest";
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    Move.joinPage: (context) => JoinPage(),
    Move.loginPage: (context) => LoginPage(),
    Move.homePage: (context) => const MainPage(),
    Move.writePage: (context) => WriteSchedule(context: context),
    Move.findPassword: (context) => FindPasswordPage(),
    Move.myPage: (context) => const MyPageMainPage(),
    Move.friendPage: (context) => FriendHomePage(),
    Move.chatPage: (context) => const ChatRoomPage(),
    Move.noticePage: (context) => NoticePage(),
    Move.chatRoomPageTest: (context) => RoomListPageTest(),
  };
}
