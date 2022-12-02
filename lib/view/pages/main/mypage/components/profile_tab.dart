import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  TextEditingController _DataTimeEditingController = TextEditingController();
  TextEditingController _EstimatedEditingController = TextEditingController();

  DateTime? tempPickedDate;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTabBar(),
        SizedBox(height: 28),
        _buildGestureDetector(context),
        Expanded(child: _buildTabBarView()),
      ],
    );
  }

  GestureDetector _buildGestureDetector(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        _selectDataCalendar_Expecteddate_visit(context);
      },
      child: AbsorbPointer(
        child: Container(
          //width: MediaQuery.of(context).size.width,
          width: 200,
          child: TextFormField(
            style: textTheme(color: kPrimaryColor(), weight: FontWeight.bold)
                .headline2,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              isDense: true,
              hintText: "날짜 선택",
              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
              suffixIcon: Image.asset("assets/arrow_bottom_black.png",
                  width: 6, height: 10),
            ),
            controller: _DataTimeEditingController,
          ),
        ),
      ),
    );
  }

  void _selectDataCalendar_Expecteddate_visit(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return SafeArea(
              child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: 440,
              child: SfDateRangePicker(
                monthViewSettings: DateRangePickerMonthViewSettings(
                  dayFormat: 'EEE',
                ),
                monthFormat: 'MMM',
                showNavigationArrow: true,
                headerStyle: DateRangePickerHeaderStyle(
                  textAlign: TextAlign.center,
                  textStyle: textTheme(
                    color: createMaterialColor(Color(0xff6E34DA)),
                    weight: FontWeight.bold,
                  ).headline1,
                ),
                headerHeight: 80,
                view: DateRangePickerView.month,
                allowViewNavigation: false,
                backgroundColor: ThemeData.light().scaffoldBackgroundColor,
                initialSelectedDate: DateTime.now(),
                minDate: DateTime.now(),
                // 아래코드는 tempPickedDate를 전역으로 받아 시작일을 선택한 날자로 시작할 수 있음
                //minDate: tempPickedDate,
                maxDate: DateTime.now().add(new Duration(days: 365)),
                // 아래 코드는 선택시작일로부터 2주까지밖에 날자 선택이 안됌
                //maxDate: tempPickedDate!.add(new Duration(days: 14)),
                selectionMode: DateRangePickerSelectionMode.single,
                confirmText: '완료',
                cancelText: '취소',
                onSubmit: (args) => {
                  setState(() {
                    _EstimatedEditingController.clear();
                    //tempPickedDate = args as DateTime?;
                    _DataTimeEditingController.text = args.toString();
                    convertDateTimeDisplay(
                        _DataTimeEditingController.text, '방문');
                    Navigator.of(context).pop();
                  }),
                },
                onCancel: () => Navigator.of(context).pop(),
                showActionButtons: true,
              ),
            ),
          ));
        });
  }

  String convertDateTimeDisplay(String date, String text) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('yyyy-MM-dd');
    final DateTime displayDate = displayFormater.parse(date);
    if (text == '방문') {
      _EstimatedEditingController.clear();
      return _DataTimeEditingController.text =
          serverFormater.format(displayDate);
    } else
      return _EstimatedEditingController.text =
          serverFormater.format(displayDate);
  }

  Widget _buildTabBar() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: klightGreyColor()),
        ),
      ),
      child: TabBar(
        labelColor: createMaterialColor(Color(0xff6E34DA)),
        labelStyle: textTheme(weight: FontWeight.bold).bodyText1,
        unselectedLabelColor: kchacholGreyColor(),
        unselectedLabelStyle: textTheme(weight: FontWeight.w500).bodyText1,
        indicatorWeight: 3,
        controller: _tabController,
        tabs: [
          Tab(child: Text("갤러리")),
          Tab(child: Text("타임라인")),
        ],
      ),
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      physics: BouncingScrollPhysics(),
      dragStartBehavior: DragStartBehavior.down,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  "assets/woman1.png",
                  width: 104,
                  height: 104,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
        Container(color: Colors.orange),
      ],
    );
  }
}
