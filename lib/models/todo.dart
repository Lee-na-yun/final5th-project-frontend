class ToDo {
  int date;
  String day;
  List<String> content;

  ToDo({
    required this.date,
    required this.day,
    required this.content,
  });
}

// 샘플 데이터
List<ToDo> ToDoList = [
  ToDo(date: 01, day: "월요일", content: ["플러터 그림 그리기"]),
  ToDo(date: 02, day: "화요일", content: ["플러터 그림 그리기"]),
  ToDo(date: 03, day: "수요일", content: ["플러터 그림 그리기"]),
  ToDo(date: 04, day: "목요일", content: ["플러터 그림 그리기"]),
  ToDo(
      date: 05, day: "금요일", content: ["플러터 그림그리기", "서버와 통신하기", "파이널 프로젝트 화이팅"]),
  ToDo(date: 06, day: "토요일", content: ["플러터 그림 그리기"]),
  ToDo(date: 07, day: "일요일", content: ["플러터 그림 그리기"]),
];
