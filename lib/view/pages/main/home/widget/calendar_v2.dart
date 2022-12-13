import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/models/event.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarV2 extends StatefulWidget {
  const CalendarV2({Key? key}) : super(key: key);

  @override
  State<CalendarV2> createState() => _CalendarV2State();
}

class _CalendarV2State extends State<CalendarV2> {
  //final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

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

    return Container(
      padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
      child: TableCalendar<Event>(
        locale: 'ko-KR',
        firstDay: DateTime.utc(2022, 01, 01),
        lastDay: DateTime.utc(2023, 12, 31),
        focusedDay: DateTime.now(),
        headerStyle: HeaderStyle(
          formatButtonVisible: true,
          formatButtonDecoration: BoxDecoration(
            border: Border.all(color: kchacholGreyColor()),
            borderRadius: BorderRadius.circular(8),
          ),
          formatButtonTextStyle: TextStyle(color: kchacholGreyColor(), fontSize: 14),
          titleCentered: true,
          titleTextStyle: GoogleFonts.notoSans(
            fontWeight: FontWeight.w800,
            fontSize: 20.0,
          ),
          leftChevronIcon: Image.asset("assets/icon_calendar_prev.png", width: 28),
          rightChevronIcon: Image.asset("assets/icon_calendar_next.png", width: 28),
          headerMargin: EdgeInsets.only(top: 8, bottom: 14, left: 20, right: 20),
        ),
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: GoogleFonts.notoSans(
            fontSize: 16,
            height: 0,
            fontWeight: FontWeight.bold,
            color: kPrimaryColor(),
          ),
          weekendStyle: GoogleFonts.notoSans(
            fontSize: 16,
            height: 0,
            fontWeight: FontWeight.bold,
            color: Color(0xffF36B7F),
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: klightGreyColor(), width: 1.0),
            ),
          ),
        ),
        calendarStyle: CalendarStyle(
          isTodayHighlighted: true,
          todayTextStyle: GoogleFonts.notoSans(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          todayDecoration: BoxDecoration(
            color: kchacholGreyColor(),
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
          markersMaxCount: 0,
          markersOffset: PositionedOffset(),
          markersAlignment: Alignment.bottomCenter,
          //markerDecoration: _buildMarker(eventList[index]),
          outsideTextStyle: GoogleFonts.notoSans(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: kmidGreyColor(),
          ),
          cellMargin: EdgeInsets.symmetric(vertical: 9, horizontal: 10),
          cellAlignment: Alignment.center,
        ),
        calendarFormat: _calendarFormat,
        eventLoader: (day) {
          return eventList;
        },
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            // Call `setState()` when updating the selected day
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          }
        },
        formatAnimationCurve: Curves.bounceIn,
        availableCalendarFormats: {
          CalendarFormat.month: '한달',
          CalendarFormat.week: '1주',
        },
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            // Call `setState()` when updating calendar format
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          // No need to call `setState()` here
          _focusedDay = focusedDay;
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
