import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/home/widget/inkwell_icon_button_widget.dart';

import '../../../../../core/theme.dart';
import '../../../../../models/event.dart';
import '../../../../../models/test/users.dart';

class UserLength {
  int userLength = users.length;

  int index() {
    if (userLength > 3) {
      return 4;
    }
    return userLength;
  }
}

class DaySchedule extends StatelessWidget {
  DaySchedule({Key? key, required this.event, required this.eventIndex}) : super(key: key);
  final Event event;
  final int eventIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: const EdgeInsets.symmetric(vertical: 20.0),
      width: MediaQuery.of(context).size.width / 2.4,
      //height: MediaQuery.of(context).size.height / 2.0,
      //height: 232.0,
      padding: EdgeInsets.only(left: 16, right: 14, top: 16),
      decoration: event.category == "일반"
          ? BoxDecoration(
              color: Color.fromRGBO(110, 52, 218, 0.1),
              borderRadius: BorderRadius.circular(10),
            )
          : event.category == "업무"
              ? BoxDecoration(
                  color: Color.fromRGBO(113, 220, 252, 0.1),
                  borderRadius: BorderRadius.circular(10),
                )
              : BoxDecoration(
                  color: Color.fromRGBO(225, 225, 29, 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _category(),
          SizedBox(height: 12),
          _scheduletitle(),
          SizedBox(height: 4),
          _buildMemo(event.memo),
          SizedBox(height: 8),
          Column(
            children: [
              _rowIconAndTextTime(),
              SizedBox(width: 8),
              _rowIconAndTextLocation(),
            ],
          ),
          Flexible(
            child: Container(
              height: MediaQuery.of(context).size.height / 8,
              child: Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      child: Stack(
                        children: List.generate(UserLength().index(), (index) => _buildStackProfileImage(index, users.length)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMemo(memoLen) {
    print("메모길이$memoLen");
    print("스케줄$eventIndex");

    memoLen.forEach((mem) {
      print('나는 $mem을 좋아해');
    });

    List test = memoLen;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var memoIndex in test)
          Text(
            memoIndex.toString(),
            style: textTheme().bodyText1,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
      ],
    );
  }

  Widget _rowIconAndTextLocation() {
    return Container(
      constraints: BoxConstraints(
        //maxWidth: 90,
        minWidth: 50,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(FontAwesomeIcons.locationDot, size: 10, color: kchacholGreyColor()),
          SizedBox(width: 4),
          Text(
            event.location,
            style: textTheme(color: kchacholGreyColor()).bodyText1,
            maxLines: 1,
            overflow: TextOverflow.clip,
          ),
        ],
      ),
    );
  }

  Container _rowIconAndTextTime() {
    return Container(
      constraints: BoxConstraints(
        //maxWidth: 90,
        minWidth: 50,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(FontAwesomeIcons.clock, size: 10, color: kchacholGreyColor()),
          SizedBox(width: 4),
          Text(
            event.startTime,
            style: textTheme(color: kchacholGreyColor()).bodyText1,
            maxLines: 1,
            overflow: TextOverflow.clip,
          ),
          Text(
            event.endTime == "" ? "" : " ~ " + event.endTime,
            style: textTheme(color: kchacholGreyColor()).bodyText1,
            maxLines: 1,
            overflow: TextOverflow.clip,
          ),
        ],
      ),
    );
  }

  // Widget _buildScheduleItem(int index) {
  //   return Column(children: [
  //     _category(),
  //     SizedBox(height: 12),
  //     _scheduletitle(index),
  //     SizedBox(height: 8),
  //     Column(
  //       children: [
  //         _rowIconAndText(CupertinoIcons.clock, ToDoList[index].time),
  //         _rowIconAndText(CupertinoIcons.location_solid, "서면 링딩동"),
  //       ],
  //     ),
  //     SizedBox(height: 6),
  //     Container(
  //       padding: EdgeInsets.only(left: 14),
  //       child: Row(
  //         children: [
  //           Expanded(
  //             child: ClipRRect(
  //               child: Stack(
  //                 children: List.generate(UserLength().index(), (index) => _buildStackProfileImage(index, users.length)),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //     SizedBox(height: 6),
  //   ]);
  // }

  Widget _buildStackProfileImage(int index, int userslength) {
    double _margin = (index * 18);

    int num = userslength - index;

    return index != 3
        ? Container(
            child: KInkWellIconButton(img: users[index].profileImg),
            padding: EdgeInsets.symmetric(horizontal: _margin),
          )
        : Container(
            margin: EdgeInsets.only(top: 6),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                color: klightGreyColor(),
              ),
              alignment: Alignment.center,
              width: 26,
              height: 26,
              child: Text("+$num", style: textTheme(weight: FontWeight.bold).bodyText2),
            ),
            padding: EdgeInsets.symmetric(horizontal: _margin),
          );
  }

  Container _rowIconAndText(icon, text) {
    return Container(
      padding: EdgeInsets.only(left: 14),
      child: Row(
        children: [
          Flexible(flex: 1, child: Icon(icon, size: 10, color: kchacholGreyColor())),
          Flexible(flex: 6, child: Text(text, style: textTheme(color: kchacholGreyColor()).bodyText2, maxLines: 1, overflow: TextOverflow.clip)),
        ],
      ),
    );
  }

  Widget _scheduletitle() {
    return Text(
      event.content,
      style: textTheme(weight: FontWeight.bold).headline3,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.left,
    );
  }

  Widget _category() {
    return Container(
      width: double.infinity,
      alignment: Alignment.topLeft,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 11, top: 3, right: 11, bottom: 4),
            decoration: event.category == "일반"
                ? BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(8),
                  )
                : event.category == "업무"
                    ? BoxDecoration(
                        color: Color(0xffAFEBFD),
                        borderRadius: BorderRadius.circular(8),
                      )
                    : BoxDecoration(
                        color: Color(0xffFFE681),
                        borderRadius: BorderRadius.circular(8),
                      ),
            child: Text(event.category, style: textTheme(color: Colors.white).bodyText1),
          ),
        ],
      ),
    );
  }
}
