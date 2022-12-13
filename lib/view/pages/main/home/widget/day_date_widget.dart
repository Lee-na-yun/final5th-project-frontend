import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/models/test/todo.dart';

import '../../../../../core/theme.dart';

class DayDate extends StatefulWidget {
  const DayDate({Key? key}) : super(key: key);

  @override
  State<DayDate> createState() => _DayDateState();
}

class _DayDateState extends State<DayDate> {
  final int dayDateLentgh = ToDoList.length;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        height: 74,
        decoration: BoxDecoration(
          color: klightGreyColor(),
          borderRadius:
              BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.zero, topRight: Radius.zero),
        ),
        padding: const EdgeInsets.all(6),
        child: Container(
          //padding: const EdgeInsets.only(left: 6),
          //margin: const EdgeInsets.symmetric(vertical: 20.0),
          //height: 54.0,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: dayDateLentgh,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => _buildDayItem(index),
          ),
        ),
      ),
    );
  }

  Container _buildDayItem(int index) {
    return Container(
      padding: EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: () {},
        child: index != 1 ? _buildDay(index, Color(0xffFFFFFF), null) : _buildDay(index, primary, Colors.white),
      ),
    );
  }

  Container _buildDay(int index, Color? color, Color? textColor) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      alignment: Alignment.center,
      //width: 42,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Text(ToDoList[index].day, style: textTheme(color: textColor).bodyText1),
          ),
          Text("$index", style: textTheme(color: textColor, weight: FontWeight.bold).bodyText1),
        ],
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
