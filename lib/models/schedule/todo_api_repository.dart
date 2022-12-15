import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:riverpod_firestore_steam1/dto/write/todo_req_dto.dart';
import 'package:riverpod_firestore_steam1/models/schedule/todo.dart';

import '../../core/http_connector.dart';

final todoApiRepository = Provider<TodoApiRepository>((ref) {
  return TodoApiRepository(ref);
});

class TodoApiRepository {
  Ref _ref;
  TodoApiRepository(this._ref);
  List<Todo> list = [];

  Todo findById(int id) {
    // http 통신코드 필요 - API문서 참조 // 통신은 메모리가 함
    Todo todoReqDto = list.singleWhere((todo) => todo.userId == id);
    return todoReqDto; //통신없이 데이터 바인딩 중
  }

  Todo insert(Todo todo) {
    // http 통신코드 필요 (product 전송)
    todo.userId = todo.todoId;
    list = [...list, todo];
    return todo;
  }
}
