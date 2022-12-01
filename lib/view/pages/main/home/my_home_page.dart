import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/components/home_app_bar.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/home/widget/home_page_top_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: Column(
        children: [
          Container(height: 320, color: kchacholGreyColor(), child: HomePageTopWidget()),
        ],
      ),
    );
  }
}
