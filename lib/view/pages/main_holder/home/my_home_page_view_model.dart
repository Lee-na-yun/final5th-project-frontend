import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_firestore_steam1/core/util/constant/move.dart';
import 'package:riverpod_firestore_steam1/dto/response_dto.dart';
import 'package:riverpod_firestore_steam1/models/schedule/schedule_home.dart';
import 'package:riverpod_firestore_steam1/provider/auth_provider.dart';
import 'package:riverpod_firestore_steam1/service/schedule_service.dart';

// 헤당 페이지의 데이터 모델
class MyHomePageModel {
  ScheduleHome? scheduleHome;
  MyHomePageModel({this.scheduleHome});
}

final myHomePageViewModel =
    StateNotifierProvider<MyHomePageViewModel, MyHomePageModel>((ref) {
  return MyHomePageViewModel(MyHomePageModel(), ref)..notifyViewModel();
});

// 해당 페이지의 데이터 관리
class MyHomePageViewModel extends StateNotifier<MyHomePageModel> {
  MyHomePageViewModel(super.state, this.ref);
  final mContext = navigatorKey.currentContext;
  Ref ref;

  Future<void> notifyViewModel() async {
    ScheduleService scheduleService = ScheduleService();
    ResponseDto responseDto = await scheduleService.fetchHome(
        ref.read(authProvider).jwtToken, "2022-12-20");
    ScheduleHome scheduleHome = responseDto.data;
    state = MyHomePageModel(scheduleHome: scheduleHome);
  }
}
