import 'dart:convert';

import 'package:http/http.dart';
import 'package:logger/logger.dart';

import '../../dto/response_dto.dart';

ResponseDto toResponseDto(Response response) {
  Map<String, dynamic> responseMap = jsonDecode(utf8.decode(response.bodyBytes)); // 문자열 -> Map
  //수정필요
  Logger().d("여기서Token 터짐...");
  ResponseDto responseDto = ResponseDto.fromJson(responseMap); // Map -> Dart Class

  return responseDto;
}
