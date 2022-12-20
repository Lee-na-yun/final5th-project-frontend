import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_firestore_steam1/dto/schedule_req_dto.dart';
import 'package:riverpod_firestore_steam1/dto/write/todo_req_dto.dart';
import 'package:riverpod_firestore_steam1/models/session_user.dart';
import 'package:riverpod_firestore_steam1/models/todo_write.dart';

import '../core/http_connector.dart';
import '../core/util/response_util.dart';
import '../dto/response_dto.dart';
import '../models/user/user.dart';

class NoteService {
  final HttpConnector httpConnector = HttpConnector();

  static final NoteService _instance = NoteService._single();
  NoteService._single();
  factory NoteService() {
    return _instance;
  }

  Future<ResponseDto> fetchInsert(
      TodoReqDto todoReqDto, String jwtToken) async {
    String requestBody = jsonEncode(todoReqDto.toJson());
    Response response =
        await httpConnector.post("/s/todo", requestBody, jwtToken: jwtToken);
    Logger().d(response.body);

    // 5. ResponseDto 만들기
    ResponseDto responseDto = toResponseDto(response);

    if (responseDto.code == 1) {
      TodoWrite todoWrite = TodoWrite.fromJson(responseDto.data);
      responseDto.data = todoWrite;
    }
    return responseDto; // ResponseDto 응답
  }
}
