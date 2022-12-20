import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../models/event.dart';

CalendarFormat _calendarFormat = CalendarFormat.month;

class Calendar extends StatelessWidget {
  final DateTime? selectedDay;
  final DateTime focusedDay;
  final OnDaySelected? onDaySelected;
  //final Event event;

  const Calendar(
      {required this.onDaySelected,
      required this.selectedDay,
      //required this.event,
      required this.focusedDay,
      Key? key})
      : super(key: key);

  // List<Event> getEventsForDay(DateTime day) {
  //   return events[day] ?? [];
  // }

  @override
  Widget build(BuildContext context) {
    final defaultBoxDeco = BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
    );
    final defaultTextStyle = GoogleFonts.notoSans(
      color: kPrimaryColor(),
      fontWeight: FontWeight.w500,
      fontSize: 14,
    );

    final Event event;
    return Container(
      padding: EdgeInsets.only(bottom: 28, left: 20, right: 20),
      child: TableCalendar(
        locale: 'ko-KR',
        daysOfWeekHeight: 30,
        focusedDay: DateTime.now(),
        firstDay: DateTime.utc(2022, 01, 01),
        lastDay: DateTime.utc(2023, 12, 31),
        headerStyle: HeaderStyle(
          formatButtonVisible: true,
          formatButtonDecoration: BoxDecoration(
            border: Border.all(color: kchacholGreyColor()),
            borderRadius: BorderRadius.circular(8),
          ),
          formatButtonTextStyle:
              TextStyle(color: kchacholGreyColor(), fontSize: 12),
          titleCentered: true,
          titleTextStyle: GoogleFonts.notoSans(
            fontWeight: FontWeight.w800,
            fontSize: 20.0,
          ),
          leftChevronIcon:
              Image.asset("assets/icon_calendar_prev.png", width: 28),
          rightChevronIcon:
              Image.asset("assets/icon_calendar_next.png", width: 28),
          headerMargin:
              EdgeInsets.only(top: 8, bottom: 12, left: 20, right: 20),
        ),
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: GoogleFonts.notoSans(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: kPrimaryColor(),
          ),
          weekendStyle: GoogleFonts.notoSans(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xffF36B7F),
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: kmidGreyColor(), width: 1.0),
            ),
          ),
        ),
        calendarStyle: CalendarStyle(
          isTodayHighlighted: true,
          todayTextStyle: GoogleFonts.notoSans(
            color: kPrimaryColor(),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          todayDecoration: BoxDecoration(
            color: kmidGreyColor(),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8),
          ),
          outsideDecoration: BoxDecoration(
            shape: BoxShape.rectangle,
          ),
          defaultDecoration: defaultBoxDeco,
          weekendDecoration: defaultBoxDeco,
          selectedDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            // border: Border.all(
            //   color: createMaterialColor(Color(0xff6E34DA)),
            //   width: 1.0,
            // ),
            color: primary,
          ),
          defaultTextStyle: defaultTextStyle,
          weekendTextStyle: defaultTextStyle,
          selectedTextStyle: GoogleFonts.notoSans(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          canMarkersOverflow: true,
          markersAutoAligned: true,
          markerSize: 4,
          markerMargin: EdgeInsets.only(left: 2, right: 2, top: 8),
          markersMaxCount: 3,
          markersOffset: PositionedOffset(),
          markersAlignment: Alignment.bottomCenter,
          markerDecoration: _buildMarker(eventList[1]),
          outsideTextStyle: GoogleFonts.notoSans(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: kmidGreyColor(),
          ),
          cellMargin: EdgeInsets.symmetric(vertical: 9, horizontal: 9),
          cellAlignment: Alignment.center,
        ),
        eventLoader: (day) {
          return eventList;
        },
        onDaySelected: onDaySelected,
        selectedDayPredicate: (DateTime date) {
          if (selectedDay == null) {
            return false;
          }
          return date.year == selectedDay!.year &&
              date.month == selectedDay!.month &&
              date.day == selectedDay!.day;
        },
        formatAnimationCurve: Curves.bounceIn,
        availableCalendarFormats: {
          CalendarFormat.month: '한달',
          CalendarFormat.week: '1주',
        },
        onFormatChanged: (format) {
          _calendarFormat = _calendarFormat;
        },
      ),
    );
  }

  BoxDecoration _buildMarker(Event eventList) {
    return BoxDecoration(
      color: eventList.category == "일반"
          ? primary
          : eventList.category == "업무"
              ? kpointMintColor()
              : kpointYellowColor(),
      shape: BoxShape.circle,
    );
  }
}
