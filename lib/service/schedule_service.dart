import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_firestore_steam1/core/http_connector.dart';
import 'package:riverpod_firestore_steam1/core/util/response_util.dart';
import 'package:riverpod_firestore_steam1/dto/response_dto.dart';
import 'package:riverpod_firestore_steam1/models/schedule/schedule_home.dart';

class ScheduleService {
  final HttpConnector httpConnector = HttpConnector();

  static final ScheduleService _instance = ScheduleService._single();
  ScheduleService._single();
  factory ScheduleService() {
    return _instance;
  }

  // startAt = 2022-12-20
  Future<ResponseDto> fetchHome(String jwtToken, String startAt) async {
    Response response =
        await httpConnector.get("/s/home?startAt=$startAt", jwtToken: jwtToken);
    Logger().d(response.body);

    ResponseDto responseDto = toResponseDto(response);
    if (responseDto.code == 1) {
      ScheduleHome scheduleHome = ScheduleHome.fromJson(responseDto.data);
      responseDto.data = scheduleHome;
    }
    return responseDto;
  }
}
