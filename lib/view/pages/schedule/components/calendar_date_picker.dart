import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';

DateTime startDate = DateTime.now();
DateTime endDate = DateTime.now();
DateTime startTime = DateTime.now();
DateTime endTime = DateTime.now();

class DateAndDayPickerInRow extends StatefulWidget {
  const DateAndDayPickerInRow({super.key});

  @override
  State<DateAndDayPickerInRow> createState() => _DateAndDayPickerInRow();
}

class _DateAndDayPickerInRow extends State<DateAndDayPickerInRow> {
  // This shows a CupertinoModalPopup with a reasonable fixed height which hosts CupertinoDatePicker.
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              // The Bottom margin is provided to align the popup above the system navigation bar.
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              // Provide a background color for the popup.
              color: CupertinoColors.systemBackground.resolveFrom(context),
              // Use a SafeArea widget to avoid system overlaps.
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildSetDay(),
          _buildSetTime(),
        ],
      ),
    );
  }

  Widget _buildSetTime() {
    String startT = DateFormat("a K:m").format(startTime).replaceAll("AM", "오전").replaceAll("PM", "오후");
    String endT = DateFormat("a K:m").format(endTime).replaceAll("AM", "오전").replaceAll("PM", "오후");
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: kchacholGreyColor()))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(flex: 1, child: const Icon(CupertinoIcons.time, color: Color(0xff9999A3))),
            Flexible(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    // Display a CupertinoDatePicker in time picker mode.
                    onPressed: () => _showDialog(
                      CupertinoDatePicker(
                        initialDateTime: startTime,
                        mode: CupertinoDatePickerMode.time,
                        use24hFormat: false,
                        // This is called when the user changes the time.
                        onDateTimeChanged: (DateTime newTime) {
                          setState(() => startTime = newTime);
                        },
                      ),
                    ),
                    // In this example, the time value is formatted manually. You can use intl package to
                    // format the value based on the user's locale settings.
                    child: Text(DateFormat("a K:m").format(startTime).replaceAll("AM", "오전").replaceAll("PM", "오후"),
                        style: textTheme().headline2),
                  ),
                  Text("~", style: textTheme(color: kchacholGreyColor()).headline1),
                  CupertinoButton(
                    // Display a CupertinoDatePicker in time picker mode.
                    onPressed: () => _showDialog(
                      CupertinoDatePicker(
                        initialDateTime: endTime,
                        mode: CupertinoDatePickerMode.time,
                        use24hFormat: false,
                        // This is called when the user changes the time.
                        onDateTimeChanged: (DateTime newTime) {
                          setState(() {
                            endTime = newTime;
                            print("종료시간$endTime");
                            print("시작시간$startTime");
                          });
                        },
                      ),
                    ),
                    // In this example, the time value is formatted manually. You can use intl package to
                    // format the value based on the user's locale settings.
                    child: _compareDateTime(endT, startT, endTime, startTime),
                    //선택된 시간이 유동적이어야 색이 변함
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSetDay() {
    String startD = DateFormat.yMMMd().format(startDate);
    String endD = DateFormat.yMMMd().format(endDate);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: kchacholGreyColor()))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(flex: 1, child: const Icon(CupertinoIcons.calendar, color: Color(0xff9999A3))),
            Flexible(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    // Display a CupertinoDatePicker in date picker mode.
                    onPressed: () => _showDialog(
                      CupertinoDatePicker(
                        initialDateTime: startDate,
                        mode: CupertinoDatePickerMode.date,
                        use24hFormat: true,
                        // This is called when the user changes the date.
                        onDateTimeChanged: (DateTime newDate) {
                          setState(() => startDate = newDate);
                        },
                      ),
                    ),
                    // In this example, the date value is formatted manually. You can use intl package
                    // to format the value based on user's locale settings.
                    child: Text(DateFormat.yMMMd().format(startDate), style: textTheme().headline2),
                  ),
                  Text("~", style: textTheme(color: kchacholGreyColor()).headline1),
                  CupertinoButton(
                    // Display a CupertinoDatePicker in date picker mode.
                    onPressed: () => _showDialog(
                      CupertinoDatePicker(
                        initialDateTime: endDate,
                        mode: CupertinoDatePickerMode.date,
                        use24hFormat: true,
                        // This is called when the user changes the date.
                        onDateTimeChanged: (DateTime newDate) {
                          setState(() => endDate = newDate);
                        },
                      ),
                    ),
                    // In this example, the date value is formatted manually. You can use intl package
                    // to format the value based on user's locale settings.
                    child: _compareDateTime(endD, startD, endDate, startDate),
                    //선택된 날짜가 유동적이어야 색이 변함
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _compareDateTime(String endString, String startString, DateTime endDate, DateTime startDate) {
    // String startD = DateFormat.yMMMd().format(startDate);
    // String endD = DateFormat.yMMMd().format(endDate);
    // 사용하는 위젯 메서드 내에서 상위와 같이  DateTime 을 String으로 바꾸어서
    // 아래의 _startDate == _endDate 처럼 같은지 비교할 수 있음
    // DateTime은 밀리 sec 때문에 깊은 비교가 안기 때문에 형변환 후 비교 해줌
    return Text(endString,
        style: textTheme(
                color: startString == endString
                    ? kchacholGreyColor()
                    : endDate.isAfter(startDate)
                        ? null
                        : kchacholGreyColor())
            .headline2);
  }
}
