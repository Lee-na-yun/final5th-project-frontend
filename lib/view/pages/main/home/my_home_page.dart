import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/components/home_app_bar.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
    );

  }
}
