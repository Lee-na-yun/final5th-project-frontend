import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';

class MyChat extends StatelessWidget {
  const MyChat({Key? key, required this.text, required this.time}) : super(key: key);
  final String text;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Text(
              time,
              style: textTheme().bodyText2,
            ),
          ),
          SizedBox(width: 6),
          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: theme().primaryColor,
              ),
              child: Text(
                text,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white, height: 1.6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
