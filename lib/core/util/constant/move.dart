import 'package:flutter/cupertino.dart';

import '../../../view/pages/main/login/find_password_page.dart';
import '../../../view/pages/main/login/join_page.dart';
import '../../../view/pages/main/login/login_page.dart';
import '../../../view/pages/main/main_page.dart';
import '../../../view/pages/main/mypage/mypage_main_page.dart';

class Move {
  static String homePage = "/home";
  static String loginPage = "/login";
  static String findPassword = "/findPassword";
  //수정필요 API 컨트롤러 문서 보고 작성할 것
  static String joinPage = "/join";
  static String myPage = "/myPage";
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    Move.joinPage: (context) => JoinPage(),
    Move.loginPage: (context) => LoginPage(),
    Move.homePage: (context) => MainPage(),
    Move.homePage: (context) => MainPage(),
    Move.findPassword: (context) => FindPasswordPage(),
    Move.myPage: (context) => const MyPageMainPage(),
  };
}
