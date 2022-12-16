import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_firestore_steam1/core/http_connector.dart';
import 'package:riverpod_firestore_steam1/core/util/constant/move.dart';
import 'package:riverpod_firestore_steam1/core/util/response_util.dart';
import 'package:riverpod_firestore_steam1/dto/response_dto.dart';
import 'package:riverpod_firestore_steam1/models/session_user.dart';
import 'package:riverpod_firestore_steam1/models/user/user.dart';
import 'package:riverpod_firestore_steam1/view/pages/main/model/main_page_view_model.dart';

const secureStorage = FlutterSecureStorage();

final authProvider = StateNotifierProvider<AuthProvider, SessionUser>((ref) {
  return AuthProvider(SessionUser(null, null, false), ref);
});

class AuthProvider extends StateNotifier<SessionUser> {
  final mContext = navigatorKey.currentContext;
  final Ref _ref;
  AuthProvider(super.state, this._ref);

  Future<void> autoLogin() async {
    final _model = _ref.read(mainPageViewModel);

    String? jwtToken = await secureStorage.read(key: "jwtToken");
    if (jwtToken != null) {
      Logger().d(jwtToken);

      Response response = await HttpConnector().get("/jwtToken", jwtToken: jwtToken);
      ResponseDto responseDto = toResponseDto(response);
      Logger().d("인스턴스 toResponseDto 로 ${responseDto.data}");
      if (responseDto.httpStatus == "OK") {
        Logger().d("자동 로그인 성공!!");
        User user = User.fromJson(responseDto.data);
        state = SessionUser(user, jwtToken, true);

        Navigator.pushNamedAndRemoveUntil(mContext!, Move.homePage, (route) => false);
      }
    }
  }

  Future<void> authentication(SessionUser? sessionUser) async {
    state = sessionUser!;
    await secureStorage.write(key: "jwtToken", value: sessionUser.jwtToken);
  }

  Future<void> inValidate() async {
    state = SessionUser(null, null, false);
    await secureStorage.delete(key: "jwtToken");
  }
}
