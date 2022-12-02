class ToDo {
  int date;
  String day;
  String content;
  String time;

  ToDo({
    required this.date,
    required this.day,
    required this.content,
    required this.time,
  });
}

// 샘플 데이터
List<ToDo> ToDoList = [
  ToDo(date: 01, day: "월요일", content: "죽고살지 못해 살까말까 응엉으엉", time: "AM 09:00 ~ PM 18:00"),
  ToDo(date: 02, day: "화요일", content: "이게 맞나싶기도 하고 해야할건 산더미", time: "PM 19:00"),
  ToDo(date: 03, day: "수요일", content: "중간정검 2", time: "AM 12:00 ~ PM 18:18"),
  ToDo(date: 04, day: "목요일", content: "검토 확인해보기", time: "AM 12:00 ~ PM 18:18"),
  ToDo(date: 05, day: "금요일", content: "프로젝트 1차 마무리 짓기", time: "AM 12:00 ~ PM 18:18"),
  ToDo(date: 06, day: "토요일", content: "죽자", time: "AM 12:00 ~ PM 18:18"),
  ToDo(date: 07, day: "일요일", content: "프로젝트 회의", time: "AM 12:00 ~ PM 18:18"),
];
