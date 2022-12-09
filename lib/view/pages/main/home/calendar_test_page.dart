import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/models/event.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/components/line_app_bar.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/home/widget/calendar.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/home/widget/calendar_list_box.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/home/widget/calendar_v2.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/home/widget/day_schedule_widget.dart';

class reservationScreen extends StatefulWidget {
  const reservationScreen({Key? key}) : super(key: key);

  @override
  State<reservationScreen> createState() => _reservationScreenState();
}

class _reservationScreenState extends State<reservationScreen> {
  DateTime selectedDay = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  DateTime focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      backgroundColor: Color(0xfff9f9f9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: LineAppBar("", "null"),
      ),
      body: Container(
        child: Column(
          children: [
            // Calendar(
            //   selectedDay: selectedDay,
            //   onDaySelected: onDaySelected,
            //   focusedDay: focusedDay,
            // ),
            CalendarV2(),

            Expanded(
              child: CustomScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                slivers: [
                  SliverFillRemaining(
                    fillOverscroll: true,
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height / 2 + bottomInset,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 0,
                                  blurRadius: 10.0,
                                  offset: Offset(0, 0), // changes position of shadow
                                ),
                              ],
                            ),
                            padding: EdgeInsets.only(top: 18),
                            child: Column(
                              children: [
                                Container(
                                  width: 50,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: kmidGreyColor(),
                                  ),
                                  margin: EdgeInsets.only(bottom: 20),
                                ),
                                Expanded(
                                  child: ListView.separated(
                                    padding: EdgeInsets.only(left: 20, right: 20),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: eventList.length,
                                    separatorBuilder: (context, index) {
                                      return SizedBox(height: 10);
                                    },
                                    itemBuilder: (context, index) {
                                      List.generate(
                                        eventList.length,
                                        (index) => CalendarListBox(
                                          event: eventList[index],
                                          eventIndex: index,
                                        ),
                                      );
                                      return CalendarListBox(
                                        event: eventList[index],
                                        eventIndex: index,
                                      );
                                    },
                                  ),
                                ),
                              ],
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
    );
  }

  onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(
      () {
        this.selectedDay = selectedDay;
        this.focusedDay = selectedDay;
      },
    );
  }
}
