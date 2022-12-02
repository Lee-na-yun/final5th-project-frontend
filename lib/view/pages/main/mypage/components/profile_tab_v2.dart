import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/models/todo.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ProfileTabV2 extends StatefulWidget {
  const ProfileTabV2({Key? key}) : super(key: key);

  @override
  State<ProfileTabV2> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTabV2>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  DateTime date = DateTime(2022, 12);

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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("${date.year}년 ${date.month}월",
                  style:
                      textTheme(color: kPrimaryColor(), weight: FontWeight.bold)
                          .headline2),
            ),
            Container(
              width: 30,
              padding: EdgeInsets.only(top: 2),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(style: BorderStyle.none),
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () async {
                  DateTime? newDate = await showDatePicker(
                    context: context,
                    initialDate: date,
                    firstDate: DateTime(2010),
                    lastDate: DateTime(2100),
                  );

                  if (newDate == null) return;
                  setState(() {
                    date = newDate;
                  });
                },
                child: Image.asset("assets/arrow_bottom_black.png"),
              ),
            )
          ],
        ),
        SizedBox(height: 10),
        Expanded(child: _buildTabBarView()),
      ],
    );
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
        Container(
          child: Row(
            children: [
              Column(
                children: [],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
