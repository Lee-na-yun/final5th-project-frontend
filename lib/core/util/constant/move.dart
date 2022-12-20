import 'package:flutter/cupertino.dart';
import 'package:riverpod_firestore_steam1/view/pages/main_holder/chat/chat_page.dart';
import 'package:riverpod_firestore_steam1/view/pages/main_holder/chat/chat_room_page.dart';
import 'package:riverpod_firestore_steam1/view/pages/main_holder/chat/chat_test_room_list_page.dart';
import 'package:riverpod_firestore_steam1/view/pages/main_holder/home/friend_home_page.dart';
import 'package:riverpod_firestore_steam1/view/pages/notice/notice_page.dart';

import '../../../view/pages/find_password/find_password_page.dart';
import '../../../view/pages/join/join_page.dart';
import '../../../view/pages/login/login_page.dart';
import '../../../view/pages/main_holder/main_page.dart';
import '../../../view/pages/main_holder/mypage/my_page.dart';
import '../../../view/pages/schedule_write/schedule_write_page.dart';

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
    Move.homePage: (context) => MainPage(),
    Move.writePage: (context) => ScheduleWrite(context: context),
    Move.findPassword: (context) => FindPasswordPage(),
    Move.myPage: (context) => MyPage(),
    Move.friendPage: (context) => FriendHomePage(),
    Move.chatPage: (context) => ChatRoomPage(),
    Move.noticePage: (context) => NoticePage(),
    Move.chatRoomPageTest: (context) => RoomListPageTest(),
  };
}
