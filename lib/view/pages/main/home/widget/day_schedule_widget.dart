import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/home/widget/inkwell_icon_button_widget.dart';
import '../../../../../core/theme.dart';
import '../../../../../models/todo.dart';
import '../../../../../models/users.dart';

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
  DaySchedule({Key? key}) : super(key: key);

  final int lentgh = ToDoList.length;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      //margin: const EdgeInsets.symmetric(vertical: 20.0),
      height: 170.0,
      child: ListView.builder(
        itemCount: lentgh,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.only(right: 12),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              //padding: EdgeInsets.only(right: 12),
              alignment: Alignment.center,
              width: 145,
              child: _buildScheduleItem(index),
              decoration: BoxDecoration(
                color: primary[50],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScheduleItem(int index) {
    return Column(children: [
      _category(),
      SizedBox(height: 12),
      _scheduletitle(index),
      SizedBox(height: 12),
      Column(
        children: [
          _rowIconAndText(CupertinoIcons.clock, ToDoList[index].time),
          _rowIconAndText(CupertinoIcons.location_solid, "서면 링딩동"),
        ],
      ),
      SizedBox(height: 6),
      Container(
        padding: EdgeInsets.only(left: 14),
        child: Row(
          children: [
            ClipRRect(
              child: Stack(
                children: List.generate(UserLength().index(), (index) => _buildStackProfileImage(index, users.length)),
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 6),
    ]);
  }

  Widget _buildStackProfileImage(int index, int userslength) {
    double _margin = (index * 17);

    int num = userslength - index;

    return index != 3
        ? Container(
            child: KInkWellIconButton(img: users[index].profileImg),
            padding: EdgeInsets.symmetric(horizontal: _margin),
          )
        : Container(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: kmidGreyColor(),
              ),
              alignment: Alignment.center,
              width: 24,
              height: 24,
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
          Flexible(
              flex: 6,
              child: Text(text,
                  style: textTheme(color: kchacholGreyColor()).bodyText2, maxLines: 1, overflow: TextOverflow.clip)),
        ],
      ),
    );
  }

  Widget _scheduletitle(int index) {
    return Flexible(
      child: Container(
        //height: 46,
        width: double.infinity,
        padding: EdgeInsets.only(left: 14, right: 14),
        child: Text(
          "seiofjsoiejfasoiefjiosejfoisaejf;oasfjsefsefsef;osjf;osajfoasfj;ojsfoiseajfoiasejfsojaf",
          style: textTheme(weight: FontWeight.bold).headline3,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  Widget _category() {
    return Container(
      width: double.infinity,
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(left: 12, top: 12, right: 12),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ksubPrimaryColor(),
            ),
            padding: EdgeInsets.only(left: 11, top: 5, bottom: 5, right: 11),
            child: Text("카테고리 명",
                style: textTheme(color: Colors.white, weight: FontWeight.bold).bodyText2,
                maxLines: 1,
                overflow: TextOverflow.clip),
          ),
        ],
      ),
    );
  }
}
