import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/models/board.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/search/components/board_list_box.dart';

import 'components/board_app_bar_v2.dart';

class BoardListPage extends StatelessWidget {
  const BoardListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BoardAppBarV2(titlename: "TODOFRIENDS", context: context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        dragStartBehavior: DragStartBehavior.down,
        children: List.generate(
          Boards.length,
          (index) => BoardListBox(board: Boards[index]),
        ),
      ),
    );
  }
}
