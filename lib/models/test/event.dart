import 'package:flutter/material.dart';

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
    content: "파이널 화이팅 파이널 화이팅 파이널 화이팅 파이널 화이팅 파이널 화이팅 파이널 화이팅 ",
    memo: ["- 메모1", "- 메모2"],
    location: "서면 어딘가",
    profileImg: "assets/woman1.png",
    color: Color(0xffAE8EEA),
    endTime: "12:00",
  ),
  Event(
    startTime: "12:00",
    category: "업무",
    content: "파이널 화이팅 파이널 화이팅 파이널 화이팅 파이널 화이팅 파이널 화이팅 파이널 화이팅 ",
    memo: ["- 메모1"],
    location: "다이소",
    profileImg: "assets/man1.png",
    color: Color(0xffAFEBFD),
    endTime: "13:00",
  ),
  Event(
    startTime: "13:00",
    category: "친구",
    content: "파이널 화이팅 파이널 화이팅 파이널 화이팅 파이널 화이팅 파이널 화이팅 파이널 화이팅 ",
    memo: ["- 메모1", "- 메모2", "- 메모3"],
    location: "덕천",
    profileImg: "assets/man2.png",
    color: Color(0xffFFE681),
    endTime: "12:00",
  ),
  Event(
    startTime: "15:00",
    category: "업무",
    content: "파이널 화이팅 파이널 화이팅 파이널 화이팅 파이널 화이팅 파이널 화이팅 파이널 화이팅 ",
    memo: ["- 메모1", "- 메모2"],
    location: "남포동",
    profileImg: "assets/dog.png",
    color: Color(0xffAE8EEA),
    endTime: "12:00",
  ),
  Event(
    startTime: "15:00",
    category: "친구",
    content: "파이널 화이팅 파이널 화이팅 파이널 화이팅 파이널 화이팅 파이널 화이팅 파이널 화이팅 ",
    memo: ["- 메모1", "- 메모2"],
    location: "해운대",
    profileImg: "assets/pig.png",
    color: Color(0xffAE8EEA),
    endTime: "18:00",
  ),
];
