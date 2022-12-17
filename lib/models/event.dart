import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Event {
  String startTime;
  String category;
  String content;
  List<String> memo = [];
  String endTime;
  String location;
  String profileImg;
  Color color;

  Event({
    required this.startTime,
    required this.category,
    required this.content,
    required this.memo,
    required this.endTime,
    required this.location,
    required this.profileImg,
    required this.color,
  });
}

List<Event> eventList = [
  Event(
    startTime: "10:00",
    category: "일반",
    content: "모의 발표날",
    memo: ["- PPT 수정"],
    location: "그린컴퓨터 학원",
    profileImg: "assets/Funny-Bunny.png",
    color: Color(0xffAE8EEA),
    endTime: "18:00",
  ),
  Event(
    startTime: "18:00",
    category: "친구",
    content: "종강 파티 가즈아!",
    memo: ["- 뿌듯하게 참석하기!"],
    location: "서면",
    profileImg: "assets/Funny-Bunny-1.png",
    color: Color(0xffAFEBFD),
    endTime: "20:00",
  ),
  Event(
    startTime: "20:00",
    category: "업무",
    content: "모의 면접 준비",
    memo: ["- 면접 복장 체크", "- 자소서 다시 보기"],
    location: "우리집",
    profileImg: "assets/Funny-Bunny-2.png",
    color: Color(0xffFFE681),
    endTime: "21:00",
  ),
  Event(
    startTime: "22:00",
    category: "일반",
    content: "블로그 정리",
    memo: ["- 프로젝트때 사용한 플러터 라이브러리 정리"],
    location: "우리집",
    profileImg: "assets/Funny-Bunny-3.png",
    color: Color(0xffAE8EEA),
    endTime: "24:00",
  ),
  // Events(
  //   startTime: "15:00",
  //   category: "일반",
  //   content: "파이널 화이팅 파이널 화이팅 파이널 화이팅 파이널 화이팅 파이널 화이팅 파이널 화이팅 ",
  //   memo: ["- 메모1", "- 메모2"],
  //   location: "해운대",
  //   profileImg: "assets/pig.png",
  //   color: Color(0xffAE8EEA),
  //   endTime: "18:00",
  // ),
];
