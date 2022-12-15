class TodoReqDto {
  final String todoTitle;
  final bool isFinished;
  final dynamic? userId;

  TodoReqDto({required this.todoTitle, required this.isFinished, required this.userId});

  Map<String, dynamic> toJson() {
    return {"todoTitle": todoTitle, "isFinished": isFinished, "userId": userId};
  }
}
