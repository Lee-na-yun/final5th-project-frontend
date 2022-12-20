import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/models/test/comment.dart';
import 'package:riverpod_firestore_steam1/view/components/schedule_app_bar_v2.dart';

import 'package:riverpod_firestore_steam1/view/pages/schedule_comment/components/submit_container.dart';
import 'package:riverpod_firestore_steam1/view/pages/schedule_comment/components/comment_body.dart';
import 'package:riverpod_firestore_steam1/view/pages/schedule_comment/components/comment_head.dart';

class ScheduleCommentListPage extends StatelessWidget {
  const ScheduleCommentListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: ScheduleAppBarV2(titlename: "댓글", context: context),
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
                    (index) =>
                        CommentBody(comments: CommentList[index], text: ""),
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
