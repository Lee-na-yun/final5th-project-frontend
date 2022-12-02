import 'package:flutter/material.dart';

import 'components/board_app_bar_v2.dart';

class BoardListPage extends StatelessWidget {
  const BoardListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BoardAppBarV2(titlename: "TODOFRIENDS"),
    );
  }
}
