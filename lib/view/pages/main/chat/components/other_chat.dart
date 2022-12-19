import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';

import '../../../../../models/test/users.dart';

class OtherChat extends StatelessWidget {
  const OtherChat({Key? key, required this.time, required this.name, required this.text, required this.img})
      : super(key: key);
  final String name;
  final String text;
  final String time;
  final User img;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(img.profileImg),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Text(
                    name,
                    style: textTheme(color: kPrimaryColor(), weight: FontWeight.bold).bodyText1,
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Color(0xfff2f2f2),
                  ),
                  child: Text(
                    text,
                    style: textTheme(color: kPrimaryColor(), weight: FontWeight.w500).bodyText1,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 6),
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Text(
              time,
              style: textTheme().bodyText2,
            ),
          )
        ],
      ),
    );
  }
}
