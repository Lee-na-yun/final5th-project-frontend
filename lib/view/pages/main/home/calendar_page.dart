import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/components/line_app_bar.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: LineAppBar("", ""),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [],
      ),
    );
  }
}
