class TodoReqDto {
  final String todoTitle;
  final bool isFinished;

  TodoReqDto({required this.todoTitle, required this.isFinished});

  Map<String, dynamic> toJson() {
    return {"todoTitle": todoTitle, "isFinished": isFinished};
  }
}
