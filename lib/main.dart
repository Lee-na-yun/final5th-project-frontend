import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:riverpod_firestore_steam1/firebase_options.dart';
import 'package:riverpod_firestore_steam1/models/session_user.dart';
import 'package:riverpod_firestore_steam1/models/user_session.dart';
import 'package:riverpod_firestore_steam1/provider/auth_provider.dart';
import 'package:riverpod_firestore_steam1/service/local_service.dart';
import 'core/routes.dart';
import 'core/theme.dart';
import 'core/util/constant/move.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await LocalService().fetchJwtToken();
//   // 자동 로그인시 필요
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(
//     const ProviderScope(child: MyApp()),
//   );
// }
//
// //final navigatorKey = GlobalKey<NavigatorState>();
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
//       child: MaterialApp(
//         navigatorKey: navigatorKey,
//         debugShowCheckedModeBanner: false,
//         theme: theme(),
//         initialRoute: UserSession.isLogin ? Move.homePage : Move.loginPage,
//         routes: getRouters(),
//         title: "TODOFRIENDS",
//       ),
//     );
//   }
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: (context, child) => MaterialApp(
        theme: theme(),
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        initialRoute: Move.homePage,
        routes: getRouters(),
      ),
    );
  }
}
