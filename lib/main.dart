import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_firestore_steam1/firebase_options.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/home/my_home_page.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/login/join_page.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/login/login_page.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/main_page.dart';

import 'core/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      initialRoute: "/login",
      routes: {
        "/login": (context) => LoginPage(),
        "/join": (context) => JoinPage(),
        //"/FindPassword":(context) => FindPasswordPage(),
        "/home": (context) => MyHomePage(),
      },
      home: LoginPage(),
      title: "TODOFRIENDS",
    );
  }
}
