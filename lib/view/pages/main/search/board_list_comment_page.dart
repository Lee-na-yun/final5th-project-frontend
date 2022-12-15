import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/models/test/comment.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/search/components/board_app_bar_v2.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/search/components/comment_body.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/search/components/comment_head.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/search/components/submit_container.dart';

class BoardListCommentPage extends StatelessWidget {
  const BoardListCommentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: BoardAppBarV2(titlename: "댓글", context: context),
        body: Column(
          children: [
            const CommentHead(),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                dragStartBehavior: DragStartBehavior.down,
                children: [
                  ...List.generate(
                    CommentList.length,
                    (index) => CommentBody(comments: CommentList[index], text: ""),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                SubmitContainer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
