import 'package:riverpod_firestore_steam1/dto/write/todo_req_dto.dart';
import 'package:riverpod_firestore_steam1/models/session_user.dart';
import 'package:riverpod_firestore_steam1/models/user/user.dart';
import 'package:riverpod_firestore_steam1/service/write_service.dart';

// flutter test test/service/write_service_test.dart
void main() async {
  WriteService writeService = WriteService();
  TodoReqDto todoReqDto = TodoReqDto(todoTitle: "제목1", isFinished: false, userId: 1);

  String token =
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJncmVlbiIsImV4cCI6MTY3MTkzMTQ3NSwidXNlck5hbWUiOiJncmVlbiIsInVzZXJJZCI6MX0.Js3qQs3I7MWFwP2eUl5nPbjY3pfFqqMJpHVHqT6Sthcl5NuIK2eKv-w-CjrObIaa5o9e486Gzy-6PYUbeZ_JSw";
  User user = User(userId: 1);

  SessionUser sessionUser = SessionUser(user, token, true);
  await writeService.fetchInsert(todoReqDto, sessionUser);
}
