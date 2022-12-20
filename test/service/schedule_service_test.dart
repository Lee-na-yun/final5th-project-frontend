import 'package:logger/logger.dart';
import 'package:riverpod_firestore_steam1/dto/response_dto.dart';
import 'package:riverpod_firestore_steam1/models/schedule/schedule_home.dart';
import 'package:riverpod_firestore_steam1/service/schedule_service.dart';

void main() async {
  String jwtToken =
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzc2FyIiwicm9sZSI6IkNVU1RPTUVSIiwiaWQiOjEsImV4cCI6MTY3MjExNjIwOH0.nQQzDrASr_MraJd5JixI5Lg6Ugb3RK7FHKw7Xqdb5UKVzrThHXKBr9Xq3qUIlFFIPVWAQkQ-z0rJgYU_Qnjxow";
  ScheduleService scheduleService = ScheduleService();
  ResponseDto responseDto =
      await scheduleService.fetchHome(jwtToken, "2022-12-20");
  ScheduleHome scheduleHome = responseDto.data;
  Logger().d(scheduleHome.followingUser.length);
  Logger().d(scheduleHome.todos.length);
  Logger().d(scheduleHome.schedules[0].note);
}
