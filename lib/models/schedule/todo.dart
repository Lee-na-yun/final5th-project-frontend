import 'dart:ffi';

class Todo {
  final Long? todoId;
  final Long? userId;
  final String? todoTitle;
  final bool? todoFinished;

  Todo(this.todoId, this.userId, this.todoTitle, this.todoFinished);
  Map<String, dynamic> toJson() => {
        "todoId": todoId,
        "userId": userId,
        "todoTitle": todoTitle,
        "todoFinished": todoFinished
      };

  Todo.fromJson(Map<String, dynamic> json)
      : todoId = json["todoId"],
        userId = json["userId"],
        todoTitle = json["todoTitle"],
        todoFinished = json["todoFinished"];
}
