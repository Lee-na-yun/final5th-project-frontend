import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/core/util/constant/move.dart';

class MyAlertDialog extends StatelessWidget {
  const MyAlertDialog({required this.msg, Key? key}) : super(key: key);

  final msg;
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text("${msg}"),
      actions: [
        CupertinoDialogAction(
          child: Text(
            "확인",
            style: textTheme().bodyText2,
          ),
          onPressed: () {
            Navigator.pop(context, Move.joinPage);
          },
        )
      ],
    );
  }
}
