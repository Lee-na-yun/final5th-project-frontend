import 'dart:convert';

import 'package:http/http.dart';

import '../../dto/response_dto.dart';

//해당 파일은, http 통신 후 json 응답개체를 Dart 타입으로 변경 해주는 거임
//서버의 ResponseDto ==> 다트의 ResponseDto
ResponseDto toResponseDto(Response response) {
  Map<String, dynamic> responseMap =
      jsonDecode(utf8.decode(response.bodyBytes)); // 문자열 -> Map
  ResponseDto responseDto =
      ResponseDto.fromJson(responseMap); // Map -> Dart Class
  return responseDto;
}
