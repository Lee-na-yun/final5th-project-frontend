import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/models/test/board.dart';
import 'package:riverpod_firestore_steam1/view/pages/schedule_list/components/schedule_list_box.dart';
import '../../components/schedule_app_bar_v2.dart';

class ScheduleListPage extends StatelessWidget {
  const ScheduleListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var index;
    return Scaffold(
      appBar: ScheduleAppBarV2(titlename: "TODOFRIENDS", context: context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        dragStartBehavior: DragStartBehavior.down,
        children: List.generate(
          Boards.length,
          (index) => ScheduleListBox(board: Boards[index]),
        ),
      ),
    );
  }
}
