import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/components/home_app_bar.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/home/home_page_top.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar("Zne.vil"),
      body: Column(
        children: [
          Container(height: 320, child: HomePageTop()),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              dragStartBehavior: DragStartBehavior.down,
              children: [
                _TimelineList(),
                _TimelineList(),
                _TimelineList(),
                _TimelineList(),
                _TimelineList(),
                _TimelineList(),
                _TimelineList(),
                _TimelineList(),
                _TimelineList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _TimelineList() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
              decoration: BoxDecoration(
                color: klightGreyColor(),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      color: kchacholGreyColor(),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "플러터 디자인 하기",
                    style: textTheme(color: kPrimaryColor(), weight: FontWeight.w500).bodyText1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
