import 'package:flutter/material.dart';
import 'package:riverpod_firestore_steam1/models/todo.dart';

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
        decoration: BoxDecoration(
          color: klightGreyColor(),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.zero,
              topRight: Radius.zero),
        ),
        padding: const EdgeInsets.all(4),
        child: Container(
          padding: const EdgeInsets.only(left: 4),
          //margin: const EdgeInsets.symmetric(vertical: 20.0),
          height: 54.0,
          child: ListView.builder(
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
      padding: EdgeInsets.only(right: 12),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          //padding: EdgeInsets.only(right: 12),
          alignment: Alignment.center,
          width: 42,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 3),
                child: Text(ToDoList[index].day, style: textTheme(color: kchacholGreyColor()).bodyText1),
              ),
              Text("2" + "$index", style: textTheme().bodyText1),
            ],
          ),
          decoration: BoxDecoration(
            color: Color(0xffFFFFFF),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
