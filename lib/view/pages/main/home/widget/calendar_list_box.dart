import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';

import 'package:riverpod_firestore_steam1/models/test/users.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/home/widget/inkwell_icon_button_widget.dart';

import '../../../../../models/event.dart';

class UserLength {
  int userLength = users.length;

  int index() {
    if (userLength > 3) {
      return 4;
    }
    return userLength;
  }
}

class CalendarListBox extends StatelessWidget {
  CalendarListBox({Key? key, required this.event, required this.eventIndex})
      : super(key: key);
  final Event event;
  final int eventIndex;
  final List<Event> fuckList = eventList;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: _buildDayList(context),
    );
  }

  Row _buildDayList(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(event.startTime,
            style: textTheme(color: kPrimaryColor()).headline3),
        SizedBox(width: 10),
        Expanded(
          child: Stack(
            children: [
              Container(
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 2),
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
                    _buildCategory(),
                    SizedBox(height: 4),
                    _buildTitleText(),
                    _buildMemo(event.memo),
                    SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _rowIconAndTextTime(),
                        SizedBox(width: 8),
                        _rowIconAndTextLocation(),
                        SizedBox(width: 10),
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.065,
                      child: Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              child: Stack(
                                children: List.generate(
                                    UserLength().index(),
                                    (index) => _buildStackProfileImage(
                                        index, users.length)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

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
              child: Text("+$num",
                  style: textTheme(weight: FontWeight.bold).bodyText2),
            ),
            padding: EdgeInsets.symmetric(horizontal: _margin),
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
            style: textTheme().headline3,
          ),
      ],
    );
  }

  Widget _rowIconAndTextLocation() {
    return Container(
      constraints: BoxConstraints(
          //maxWidth: 90,
          //minWidth: 50,
          ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(FontAwesomeIcons.locationDot,
              size: 10, color: kchacholGreyColor()),
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
          //minWidth: 50,
          ),
      child: Padding(
        padding: const EdgeInsets.only(top: 2),
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
              " ~ " + event.endTime,
              style: textTheme(color: kchacholGreyColor()).bodyText1,
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ],
        ),
      ),
    );
  }

  Text _buildTitleText() {
    return Text(
      event.content,
      style: textTheme(weight: FontWeight.bold).headline2,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.left,
    );
  }

  Container _buildCategory() {
    return Container(
      padding: EdgeInsets.only(left: 12, right: 12, bottom: 6, top: 3),
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
      child:
          Text(event.category, style: textTheme(color: Colors.white).bodyText1),
    );
  }
}
