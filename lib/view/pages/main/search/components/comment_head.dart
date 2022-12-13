import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/models/test/board.dart';
import 'package:riverpod_firestore_steam1/models/test/comment.dart';

class CommentHead extends StatelessWidget {
  const CommentHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(110, 52, 218, 0.08)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMyProfileImage(),
            SizedBox(width: 10),
            Expanded(child: _buildText()),
          ],
        ),
      ),
    );
  }

  Widget _buildMyProfileImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        "assets/woman1.png",
        width: 30,
        height: 30,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          commentTitle,
          style: textTheme(color: kPrimaryColor(), weight: FontWeight.bold).bodyText1,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 6),
        Text(
          commentContent,
          style: textTheme(color: kPrimaryColor(), weight: FontWeight.w200).bodyText1,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
