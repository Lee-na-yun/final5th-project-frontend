import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

import '../core/http_connector.dart';
import '../core/util/response_util.dart';
import '../dto/response_dto.dart';
import '../models/user/user.dart';
import '../models/user_session.dart';

const secureStorage = FlutterSecureStorage();

class LocalService {
  final HttpConnector httpConnector = HttpConnector();

  static final LocalService _instance = LocalService._single();
  LocalService._single();
  factory LocalService() {
    Logger().d("LocalRepository 생성자");
    return _instance;
  }

  Future<void> fetchJwtToken() async {
    Logger().d("jwt init");
    String? deviceJwtToken = await secureStorage.read(key: "jwtToken");
    if (deviceJwtToken != null) {
      Response response =
          await httpConnector.getInitSession("/jwtToken", deviceJwtToken);
      ResponseDto responseDto = toResponseDto(response);

      if (responseDto.code == 1) {
        User user = User.fromJson(responseDto.data);
        UserSession.successAuthentication(user, deviceJwtToken);
      } else {
        Logger().d("토큰이 만료됨");
        UserSession.removeAuthentication();
      }
    }
  }

  Future<void> fetchDeleteJwtToken() async {
    Logger().d("jwt remove");
    await secureStorage.delete(key: "jwtToken");
  }
}
