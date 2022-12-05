import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/models/comment.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/search/components/comment_body.dart';

class SubmitContainer extends StatefulWidget {
  const SubmitContainer({Key? key}) : super(key: key);

  @override
  State<SubmitContainer> createState() => _SubmitContainerState();
}

class _SubmitContainerState extends State<SubmitContainer> {
  final TextEditingController _textController = TextEditingController();
  final List<CommentBody> cb = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildSubmitContainer(),
    );
  }

  Widget _buildSubmitContainer() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            width: 1,
            color: Color(0xffd9d9d9),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: Image.asset("assets/chat_flus.png", width: 18, height: 18),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: TextField(
                controller: _textController,
                maxLines: 1,
                style: textTheme().headline3,
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
                onSubmitted: _handleSubmitted,
              ),
              height: 40,
              //width: 226,
              decoration: BoxDecoration(
                color: Color(0xfff2f2f2),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(width: 6),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: theme().primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ElevatedButton(
                onPressed: () {
                  _handleSubmitted(context);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                ),
                child: Text(
                  "전송",
                  style: textTheme(color: Colors.white, weight: FontWeight.w600).headline3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleSubmitted(text) {
    _textController.clear();
    setState(() {
      cb.add(
        CommentBody(
          text: text,
          comments: Comments(userImg: "assets/woman1.png", friendName: "", comment: ""),
        ),
      );
    });
  }
}
