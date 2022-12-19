import 'dart:convert';

import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_firestore_steam1/dto/write/todo_req_dto.dart';
import 'package:riverpod_firestore_steam1/models/session_user.dart';

import '../core/http_connector.dart';
import '../core/util/response_util.dart';
import '../dto/response_dto.dart';
import '../models/user/user.dart';

class WriteService {
  final HttpConnector httpConnector = HttpConnector();

  static final WriteService _instance = WriteService._single();
  WriteService._single();
  factory WriteService() {
    return _instance;
  }

  Future<ResponseDto> fetchInsert(TodoReqDto todoReqDto, SessionUser sessionUser) async {
    String requestBody = jsonEncode(todoReqDto.toJson());
    Logger().d("투두 작성 ${requestBody}");
    Response response = await httpConnector.post("/s/api/user/${sessionUser.user.userId}/todo", requestBody, jwtToken: sessionUser.jwtToken);
    Logger().d(response.body);

    // 5. ResponseDto 만들기
    ResponseDto responseDto = toResponseDto(response);

    if (responseDto.httpStatus == "CREATED") {
      User user = User.fromJson(responseDto.data);
      responseDto.data = user;
    }
    return responseDto; // ResponseDto 응답
  }
}
