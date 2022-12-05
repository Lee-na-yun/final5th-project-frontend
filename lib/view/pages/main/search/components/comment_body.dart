import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/models/comment.dart';

class CommentBody extends StatelessWidget {
  const CommentBody({Key? key, required this.comments}) : super(key: key);
  final Comments comments;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFriendProfile(),
          SizedBox(width: 10),
          Expanded(child: _buildFriendText()),
        ],
      ),
    );
  }

  Widget _buildFriendProfile() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        "${comments.userImg}",
        width: 30,
        height: 30,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildFriendText() {
    return Visibility(
      //visible: comment. != '' && comment.comment != '',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${comments.friendName}",
            style: textTheme(color: kPrimaryColor(), weight: FontWeight.bold)
                .bodyText1,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${comments.comment}",
                style:
                    textTheme(color: kPrimaryColor(), weight: FontWeight.w200)
                        .bodyText1,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.asset(CommentmyImg,
                          width: 18, height: 18, fit: BoxFit.cover),
                    ),
                    SizedBox(width: 8),
                    Row(
                      children: [
                        Text(
                          "${comments.friendName}",
                          style: textTheme(
                                  color: kPrimaryColor(),
                                  weight: FontWeight.bold)
                              .bodyText1,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "님에게 답글달기...",
                          style: textTheme(
                                  color: kchacholGreyColor(),
                                  weight: FontWeight.w200)
                              .bodyText1,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
