import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/home/widget/day_date_widget.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/home/widget/day_schedule_widget.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/home/widget/inkwell_icon_button_widget.dart';

import 'my_home_page.dart';

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
        SingleChildScrollView(
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.27,
                child: ListView.separated(
                  padding: EdgeInsets.only(left: 20),
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: globalScheduleItems.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 10);
                  },
                  itemBuilder: (context, index) {
                    Logger().d("스케줄 길이 ${globalScheduleItems.length}");
                    List.generate(
                      globalScheduleItems.length,
                      (index) => DaySchedule(
                        event: globalScheduleItems[index],
                        eventIndex: index,
                      ),
                    );
                    return DaySchedule(
                      event: globalScheduleItems[index],
                      eventIndex: index,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTopfirstline() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        //아래 버튼은 추후에 DropDown 버튼 추가할지 고민
        children: [
          _buildMonthDropdown(),
          SizedBox(width: 6),
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
        child: Text("12월", style: textTheme(weight: FontWeight.bold).headline1));
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
