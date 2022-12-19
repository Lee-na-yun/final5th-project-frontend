import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:remedi_kopo/remedi_kopo.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/components/line_app_bar.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/home/my_home_page.dart';

import '../../../core/theme.dart';
import '../../../models/event.dart';
import '../../../models/test/users.dart';
import 'components/calendar_date_picker.dart';

class WriteSchedule extends StatefulWidget {
  WriteSchedule({Key? key, required this.context}) : super(key: key);
  final BuildContext context;

  @override
  State<WriteSchedule> createState() => _WriteScheduleState();
}

class _WriteScheduleState extends State<WriteSchedule> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _scheduleController = TextEditingController();
  TextEditingController _AddressController = TextEditingController();
  final List<User> userList = List.of(users);
  final List<Event> fuckList = eventList;

  int selectedId = 0;
  List<String> hintText = ["반복 안함", "매일", "매주", "매월"];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: LineAppBar("일정 작성", null),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildScheduleTitle("제목"),
                  SizedBox(height: 14),
                  Row(
                    children: [
                      _buildCategory("카테고리"),
                      _buildCategory("일반"),
                      _buildCategory("업무"),
                      _buildCategory("친구"),
                    ],
                  ),
                  SizedBox(height: 14),
                  DateAndDayPickerInRow(),
                  _buildLocationSearch(context),
                  //AddressComponentTest(),
                  Row(
                    children: [
                      Expanded(child: _buildRepeatSetting(context)),
                    ],
                  ),
                  _buildMemo(context),
                  _buildInvitation(context),
                  //SizedBox(height: 70),
                  _buildInsertButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategory(String category) {
    return Row(
      children: [
        category == "카테고리"
            ? Container(
                padding: EdgeInsets.only(left: 12, right: 12, bottom: 6, top: 3),
                decoration: BoxDecoration(
                  color: kchacholGreyColor(),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Text(category, style: textTheme(color: Colors.white).bodyText1),
                    SizedBox(width: 4),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: SvgPicture.asset("assets/icon_circle_plus2.svg", width: 10),
                    ),
                  ],
                ),
              )
            : Container(
                padding: EdgeInsets.only(left: 12, right: 12, bottom: 6, top: 3),
                decoration: category == "일반"
                    ? BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(8),
                      )
                    : category == "업무"
                        ? BoxDecoration(
                            color: Color(0xffAFEBFD),
                            borderRadius: BorderRadius.circular(8),
                          )
                        : BoxDecoration(
                            color: Color(0xffFFE681),
                            borderRadius: BorderRadius.circular(8),
                          ),
                child: Text(category, style: textTheme(color: Colors.white).bodyText1),
              ),
        SizedBox(width: 8),
      ],
    );
  }

  Widget _buildRepeatSetting(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 4),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: klightGreyColor(), width: 1))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                //SizedBox(width: 5),
                SvgPicture.asset(
                  "assets/icon_repeat.svg",
                  width: 12,
                ),
                SizedBox(width: 20),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  //반응형을 위한 가로 폭
                  height: 55,
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "${hintText[selectedId]}",
                                border: InputBorder.none,
                                isDense: true,
                                hintStyle: textTheme(color: kchacholGreyColor(), weight: FontWeight.w600).headline3),
                            readOnly: true,
                            style: textTheme(color: primary).headline3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildRepeatButton(0, "반복 안함"),
                      _buildRepeatButton(1, "매일"),
                      _buildRepeatButton(2, "매주"),
                      _buildRepeatButton(3, "매월"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRepeatButton(int id, String hintText) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, left: 0, right: 0),
      child: Row(
        children: [
          hintText == "반복 안함"
              ? Container(
                  height: 35,
                  padding: EdgeInsets.only(right: 8),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedId = id;
                      });
                    },
                    child: Text(
                      hintText,
                      style: textTheme(color: Colors.white, weight: FontWeight.w500).bodyText1,
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0.0,
                      padding: EdgeInsets.only(left: 11, top: 3, right: 11, bottom: 2),
                    ),
                  ),
                )
              : Container(
                  padding: EdgeInsets.only(right: 8),
                  width: 68,
                  height: 35,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedId = id;
                      });
                    },
                    child: Text(
                      hintText,
                      style: textTheme(color: kchacholGreyColor(), weight: FontWeight.w500).bodyText1,
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0.0,
                      padding: EdgeInsets.only(left: 11, top: 3, right: 11, bottom: 2),
                      primary: klightGreyColor(),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  Padding _buildLocationSearch(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: klightGreyColor(), width: 1))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //SizedBox(width: 5),
            SvgPicture.asset(
              "assets/icon_location.svg",
              width: 12,
            ),
            SizedBox(width: 14),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              //반응형을 위한 가로 폭
              height: 55,
              padding: EdgeInsets.symmetric(vertical: 8),
              child: GestureDetector(
                onTap: () {
                  HapticFeedback.mediumImpact();
                  _addressAPI(); // 카카오 주소 API
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: 220,
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "장소",
                              border: InputBorder.none,
                              isDense: false,
                              hintStyle: textTheme(color: kchacholGreyColor(), weight: FontWeight.w600).headline3),
                          readOnly: true,
                          controller: _AddressController,
                          style: textTheme(color: primary).headline3,
                        ),
                      ),
                    ),
                    Container(
                      height: 35,
                      child: ElevatedButton(
                        onPressed: () {
                          _handleSubmitted(_textController.text);
                          HapticFeedback.mediumImpact();
                          _addressAPI();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: kchacholGreyColor(),
                          padding: EdgeInsets.symmetric(horizontal: 11, vertical: 4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          elevation: 0.0,
                        ),
                        child: Text(
                          "주소 검색",
                          style: textTheme(weight: FontWeight.w600).bodyText1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //카카오 API 사용을 위한 메서드
  _addressAPI() async {
    KopoModel model = await Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => RemediKopo(),
      ),
    );
    _AddressController.text = '${model.address!} ${model.buildingName!}';
  }

  TextField _buildScheduleTitle(text) {
    return TextField(
      controller: _scheduleController,
      style: textTheme(color: kchacholGreyColor()).headline2,
      maxLines: null, //이걸 NULL 로 해주고
      maxLength: 100,
      decoration: const InputDecoration(
        isDense: true,
        hintText: "제목",
        hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff9999A3), height: 2.8),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xff9999A3))),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xff9999A3))),
        focusColor: Color(0xff9999A3),
        contentPadding: EdgeInsets.only(left: 8),
      ),
      onSubmitted: _handleSubmitted,
    );
  }

  void _handleSubmitted(text) {
    DateTime now = DateTime.now();
    String _parse = DateFormat("hh:mm").format(now);

    print(text);
    setState(() {
      globalScheduleItems.add(Event(
        category: "일반",
        color: Color(0xff6E34DA),
        content: _scheduleController.text,
        startTime: _parse,
        endTime: "",
        location: "청와대",
        memo: ["- ${_textController.text}"],
        profileImg: "",
      ));
      _textController.clear();
    });
  }

  PreferredSize _buildSearchAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(55),
      child: Padding(
        padding: const EdgeInsets.only(top: 14),
        child: AppBar(
          leading: IconButton(
            icon: SvgPicture.asset("assets/icon_arrow_back.svg", width: 10),
            onPressed: () {
              Navigator.pop(context);
            },
            color: kPrimaryColor(),
          ),
          title: Container(
            height: 40,
            //width: 100,
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("스케줄 작성", style: textTheme(color: Colors.black).headline1, textAlign: TextAlign.center),
              ],
            ),
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }

  Widget _buildMemo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 16),
      child: Container(
        width: MediaQuery.of(context).size.width,
        //반응형을 위한 가로 폭
        height: 55,

        child: Stack(
          children: [
            Positioned(
              top: 8,
              left: 4,
              child: SvgPicture.asset("assets/icon_pen.svg", width: 13),
            ),
            TextField(
              controller: _textController,
              style: textTheme(color: kchacholGreyColor()).headline2,
              maxLines: null, //이걸 NULL 로 해주고
              maxLength: 80,
              decoration: const InputDecoration(
                isDense: false,
                hintText: "메모",
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff9999A3),
                  height: 1.6,
                ),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffF2F2F2))),
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffF2F2F2))),
                focusColor: Color(0xff9999A3),
                contentPadding: EdgeInsets.only(left: 34, bottom: 16),
              ),
              onSubmitted: _handleSubmitted,
            ),
            // Positioned(
            //   right: 0,
            //   child: SvgPicture.asset("assets/photo_plus_icon.svg", width: 26),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildInvitation(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: klightGreyColor(), width: 1))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //SizedBox(width: 5),
            SvgPicture.asset(
              "assets/icon_invite.svg",
              width: 12,
            ),
            SizedBox(width: 14),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              //반응형을 위한 가로 폭
              height: 55,
              padding: EdgeInsets.symmetric(vertical: 8),
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: 220,
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "초대",
                              border: InputBorder.none,
                              isDense: false,
                              hintStyle: textTheme(color: kchacholGreyColor(), weight: FontWeight.w600).headline3),
                          readOnly: true,
                          //controller:,
                          style: textTheme(color: primary).headline3,
                        ),
                      ),
                    ),
                    Container(
                      height: 35,
                      child: ElevatedButton(
                        onPressed: () {
                          //_handleSubmitted(_textController.text);
                          HapticFeedback.mediumImpact();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: kchacholGreyColor(),
                          padding: EdgeInsets.symmetric(horizontal: 11, vertical: 4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          elevation: 0.0,
                        ),
                        child: Text(
                          "친구 검색",
                          style: textTheme(weight: FontWeight.w600).bodyText1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInsertButton() {
    return Container(
      height: MediaQuery.of(context).size.height / 6,
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            _handleSubmitted("go");
            Navigator.popAndPushNamed(context, "/home");
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            minimumSize: Size(double.infinity, 52),
            elevation: 0.0,
            primary: primary,
          ),
          child: Text(
            "등록하기",
            style: textTheme(color: Colors.white, weight: FontWeight.bold).headline2,
          ),
        ),
      ),
    );
  }
}
