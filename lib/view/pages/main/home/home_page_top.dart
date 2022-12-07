import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/home/widget/day_date_widget.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/home/widget/day_schedule_widget.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/home/widget/inkwell_icon_button_widget.dart';

class HomePageTop extends StatelessWidget {
  const HomePageTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTopfirstline(),
        SizedBox(height: 18),
        DayDate(),
        SizedBox(height: 16),
        DaySchedule(),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //아래 버튼은 추후에 DropDown 버튼 추가할지 고민
              children: [
                Text("ToDo", style: textTheme(weight: FontWeight.bold).headline1),
              ]),
        )
      ],
    );
  }

  Widget _buildTopfirstline() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        //아래 버튼은 추후에 DropDown 버튼 추가할지 고민
        children: [
          _buildMonthDropdown(),
          SizedBox(width: 4),
          KInkWellIconButton(icon: Icons.calendar_today_outlined, img: null),
        ],
      ),
    );
  }

  Widget _buildMonthDropdown() {
    return InkWell(
        onTap: () {
          print("클릭 됨 11월 버튼");
        },
        child: Text("11월", style: textTheme().headline1));
  }
}

Widget _buildHorizontalListSample() {
  return Container(
    padding: EdgeInsets.only(left: 20),
    margin: EdgeInsets.symmetric(vertical: 20.0),
    height: 54.0,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[Container(width: 42.0, color: Colors.red)],
    ),
  );
}
