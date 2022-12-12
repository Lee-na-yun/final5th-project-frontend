import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:remedi_kopo/remedi_kopo.dart';
import '../../../core/theme.dart';
import '../../../models/test/todo.dart';
import '../../../models/test/users.dart';
import '../main/components/address_component_test.dart';
import 'components/calendar_date_picker.dart';

class WriteSchedule extends StatefulWidget {
  WriteSchedule({Key? key, required this.context}) : super(key: key);
  final BuildContext context;

  @override
  State<WriteSchedule> createState() => _WriteScheduleState();
}

class _WriteScheduleState extends State<WriteSchedule> {
  final TextEditingController _textController = TextEditingController();
  TextEditingController _AddressController = TextEditingController();
  final List<User> userList = List.of(users);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildSearchAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildScheduleTitle("할 일 작성"),
            SizedBox(height: 20),
            DateAndDayPickerInRow(),
            _buildLocationSearch(context),
            //AddressComponentTest(),
            _buildRepeatSetting(context)
          ],
        ),
      ),
    );
  }

  Widget _buildRepeatSetting(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: kchacholGreyColor(), width: 1))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Icon(Icons.event_repeat_outlined, color: Color(0xff9999A3)),
            SizedBox(width: 14),
            Container(
              width: MediaQuery.of(context).size.width - 80,
              //반응형을 위한 가로 폭
              height: 55,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      "반복 ( 구현 하나도 안됐지롱 ) ",
                      style: textTheme(color: kchacholGreyColor()).headline3,
                    ),
                  ),
                  Container(
                      width: 88,
                      height: 27,
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {
                          _handleSubmitted(_textController.text);
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: kGreyColor(),
                          padding: EdgeInsets.symmetric(horizontal: 11),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                          elevation: 0.0,
                        ),
                        child: Text(
                          "주소 검색",
                          style: textTheme().headline2,
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildLocationSearch(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: kchacholGreyColor(), width: 1))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Icon(Icons.location_on_outlined, color: Color(0xff9999A3)),
            SizedBox(width: 14),
            Container(
              width: MediaQuery.of(context).size.width - 80,
              //반응형을 위한 가로 폭
              height: 55,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: GestureDetector(
                onTap: () {
                  HapticFeedback.mediumImpact();
                  _addressAPI(); // 카카오 주소 API
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: SizedBox(
                        width: 220,
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "장소",
                              border: InputBorder.none,
                              isDense: false,
                              hintStyle: textTheme(color: kchacholGreyColor()).headline3),
                          readOnly: true,
                          controller: _AddressController,
                          style: textTheme(color: primary).headline3,
                        ),
                      ),
                    ),
                    Container(
                      height: 27,
                      child: ElevatedButton(
                        onPressed: () {
                          _handleSubmitted(_textController.text);
                          HapticFeedback.mediumImpact();
                          _addressAPI();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: kGreyColor(),
                          padding: EdgeInsets.symmetric(horizontal: 11),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                          ),
                          elevation: 0.0,
                        ),
                        child: Text(
                          "주소 검색",
                          style: textTheme().headline2,
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
      controller: _textController,
      style: textTheme().headline1,
      maxLines: null, //이걸 NULL 로 해주고
      maxLength: 100,
      decoration: const InputDecoration(
          hintText: "할 일 작성",
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          focusColor: Colors.black),
      onSubmitted: _handleSubmitted,
    );
  }

  void _handleSubmitted(text) {
    _textController.clear();
    print(text);

    ToDo(
      content: text,
      time: DateFormat("a K:m").format(new DateTime.now()),
      date: 08,
      day: "Mon",
      done: false,
    );
  }

  PreferredSize _buildSearchAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(55),
      child: Padding(
        padding: const EdgeInsets.only(top: 14),
        child: AppBar(
          leading: IconButton(
            icon: Image.asset("assets/icon_arrow_back.png", width: 10),
            onPressed: () {
              Navigator.pop(context);
            },
            color: kPrimaryColor(),
          ),
          title: Container(
            height: 40,
            width: 100,
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
}
