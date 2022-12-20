import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_firestore_steam1/core/theme.dart';
import 'package:riverpod_firestore_steam1/models/test/mypage.dart';
import 'package:riverpod_firestore_steam1/models/test/todo.dart';
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

  final myImages = [
    "assets/man1.png",
    "assets/man2.png",
    "assets/woman1.png",
    "assets/pig.png",
    "assets/dog.png",
    "assets/aliens.png",
    "assets/man1.png",
    "assets/man2.png",
    "assets/woman1.png",
    "assets/pig.png",
    "assets/dog.png",
    "assets/aliens.png",
  ];

  var today;

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
                child:
                    SvgPicture.asset("assets/icon_arrow_bottom.svg", width: 16),
              ),
            ),
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
          bottom: BorderSide(width: 1, color: kmidGreyColor()),
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
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            itemCount: 40,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image(
                  image: NetworkImage(
                      "https://source.unsplash.com/random?sig=$index/200x200"),
                  fit: BoxFit.cover,
                  width: 200,
                  height: 200,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: kchacholGreyColor(),
                    child: const Icon(
                      Icons.error_outline_rounded,
                      color: primary,
                      size: 40,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        ListView(
          physics: BouncingScrollPhysics(),
          dragStartBehavior: DragStartBehavior.down,
          children: [
            _TimelineList("18", "일요일", "파이널 프로젝트 마무리!"),
            _TimelineList("19", "월요일", "하브루타 노트 작성하기"),
            _TimelineList("20", "화요일", "블로그 정리하기"),
            _TimelineList("21", "수요일", "플러터 라이브러리 공부 및 블로그 정리"),
            _TimelineList("22", "목요일", "PPT 제작"),
            _TimelineList("23", "금요일", "TODOFRIENDS 앱 영상 촬영하기"),
            _TimelineList("24", "토요일", "팀원들이랑 일정 공유하기"),
            _TimelineList("25", "일요일", "강아지 산책하기"),
            _TimelineList("26", "월요일", "파이널 프로젝트 마무리!"),
            _TimelineList("27", "화요일", "노션 정리"),
          ],
        ),
      ],
    );
  }

  Container _TimelineList(String date, String day, String content) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 10, top: 5),
            child: Column(
              children: [
                Text(
                  date,
                  style:
                      textTheme(color: kPrimaryColor(), weight: FontWeight.bold)
                          .headline2,
                ),
                Text(
                  day,
                  style: textTheme(color: kchacholGreyColor()).bodyText2,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
              decoration: BoxDecoration(
                color: klightGreyColor(),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      color: kchacholGreyColor(),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    content,
                    style: textTheme(
                            color: kPrimaryColor(), weight: FontWeight.w500)
                        .bodyText1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
