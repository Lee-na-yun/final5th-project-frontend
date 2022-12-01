import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/components/home_app_bar.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: Container(
        height: 320,
        color: Colors.grey,
        child: Column(
          children: [
            Row(
              children: [
                Text("11월", style: textTheme(color: Color(0xffFFFFFF), weight: FontWeight.bold).headline1),
                Container(
                  width: 24,
                  height: 24,
                  child: Icon(Icons.calendar_today_outlined, size: 15),
                  //decoration: BoxDecoration(color: Colors),
                ),
              ],
            )
          ],
        ),
      ),
    );

  }
}
