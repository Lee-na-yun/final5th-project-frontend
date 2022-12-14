import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_firestore_steam1/core/util/constant/move.dart';
import 'package:riverpod_firestore_steam1/dto/response_dto.dart';
import 'package:riverpod_firestore_steam1/models/session_user.dart';
import 'package:riverpod_firestore_steam1/provider/auth_provider.dart';
import 'package:riverpod_firestore_steam1/service/user_service.dart';

import '../../../../models/user/user.dart';

class MainPageModel {
  User user;
  MainPageModel(this.user);
}

final mainPageViewModel = StateNotifierProvider.autoDispose<MainPageViewModel, MainPageModel>((ref) {
  return MainPageViewModel(MainPageModel(User(1, "0")), ref)..initViewModel();
});

class MainPageViewModel extends StateNotifier<MainPageModel> {
  final UserService userService = UserService();
  final mContext = navigatorKey.currentContext;
  final Ref _ref;
  MainPageViewModel(super.state, this._ref);

  Future<void> initViewModel() async {
    SessionUser sessionUser = _ref.read(authProvider);
    ResponseDto responseDto = await userService.fetchUserInfo(sessionUser.user.userId, sessionUser.jwtToken);
    if (responseDto.httpStatus == "OK") {
      state = MainPageModel(responseDto.data);
    } else {
      ScaffoldMessenger.of(mContext!).showSnackBar(
        const SnackBar(content: Text("잘못된 요청입니다.")),
      );
    }
  }
}
