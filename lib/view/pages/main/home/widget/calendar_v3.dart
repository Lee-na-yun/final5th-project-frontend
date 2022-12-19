/*
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/view/pages/schedule/write_schedule_page.dart';

import '../../../../../models/event.dart';

class CalendarV3 extends StatefulWidget {
  const CalendarV3({Key? key}) : super(key: key);

  @override
  State<CalendarV3> createState() => _CalendarV3State();
}

class _CalendarV3State extends State<CalendarV3> {
  EventList<Event> markedDateMap = EventList(events: {});
  List<Events> events = List.empty(growable: true);

  Widget eventIcon = Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Icon(
      Icons.person,
      color: Colors.amber,
    ),
  );

  @override
  Widget build(BuildContext context) {
    markedDateMap = EventList(events: {});
    for (int i = 0; i < events.length; i++) {
      Events event = events[i];
      List dateDelim = event.date.split('-');
      DateTime eventDate = DateTime(
        int.parse(dateDelim[0]),
        int.parse(dateDelim[1]),
        int.parse(dateDelim[2]),
      );
      markedDateMap.add(
        eventDate,
        Event(
          date: eventDate,
          icon: Container(
            decoration: BoxDecoration(color: primary),
          ),
        ),
      );
    }

    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: CalendarCarousel<Event>(
          //thisMonthDayBorderColor: Colors.blue,
          weekdayTextStyle:
              textTheme(color: kPrimaryColor(), weight: FontWeight.bold)
                  .headline3,
          headerTextStyle:
              textTheme(color: kPrimaryColor(), weight: FontWeight.bold)
                  .headline1,
          selectedDayTextStyle: textTheme(color: primary).headline3,
          todayButtonColor: primary,
          todayTextStyle: textTheme(color: Colors.white).headline3,
          todayBorderColor: primary,
          daysHaveCircularBorder: true,
          markedDatesMap: markedDateMap,
          onDayPressed: (DateTime datetime, List<Event> event) {
            _showContent(context, datetime);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () async {
            await showDialog(
              context: context,
              builder: (context) {
                TextEditingController dateController = TextEditingController();
                TextEditingController contentController =
                    TextEditingController();
                return AlertDialog(
                  title: Text("날짜입력(yyyy-mm-dd)"),
                  content: Container(
                    height: 200,
                    child: Column(
                      children: [
                        TextField(
                          controller: dateController,
                          style: textTheme().headline1,
                        ),
                        TextField(
                          controller: contentController,
                          style: textTheme().headline1,
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          String eventDate = dateController.value.text;
                          String eventContent = contentController.value.text;
                          setState(() {
                            events.add(
                                Events(date: eventDate, content: eventContent));
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text("등록하기")),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("취소하기")),
                  ],
                );
              },
            );
          }),
    );
  }

  void _showContent(BuildContext context, DateTime datetime) async {
    showBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height / 2.5,
          child: Column(
            children: [
              Text(
                DateFormat("yyyy-mm-dd").format(datetime),
                textAlign: TextAlign.center,
                style: textTheme().headline1,
              ),
              Divider(),
              Expanded(
                child: ListView.builder(
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    Events event = events[index];
                    if (event.date !=
                        "${datetime.year}-${datetime.month}-${datetime.day}") {
                      return Container(height: 0);
                    }

                    return Container(
                      color: Colors.grey,
                      child: ListTile(
                        title: Text(events[index].content),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
*/
