import 'dart:convert';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import '../core/http_connector.dart';
import '../core/util/response_util.dart';
import '../dto/response_dto.dart';
import '../dto/user/auth_req_dto.dart';
import '../models/user/user.dart';
import 'local_service.dart';

class UserService {
  final HttpConnector httpConnector = HttpConnector();

  static final UserService _instance = UserService._single();
  UserService._single();
  factory UserService() {
    return _instance;
  }

  Future<ResponseDto> fetchJoin(JoinReqDto joinReqDto) async {
    String requestBody = jsonEncode(joinReqDto.toJson());
    Response response = await httpConnector.post("/join", requestBody);

    return toResponseDto(response); // ResponseDto 응답
  }

  Future<ResponseDto> fetchLogin(LoginReqDto loginReqDto) async {
    // 1. json 변환
    String requestBody = jsonEncode(loginReqDto.toJson());

    // 2. 통신 시작
    Response response = await httpConnector.post("/login", requestBody);

    // 3. 토큰 받기
    String jwtToken = response.headers["authorization"].toString();
    // 4. 토큰을 디바이스에 저장
    await secureStorage.write(key: "jwtToken", value: jwtToken);
    // 5. ResponseDto 만들기
    ResponseDto responseDto = toResponseDto(response);
    Logger().d("로그인 하면 뜨는 값 토큰${responseDto.data}");

    if (responseDto.httpStatus == "CREATED") {
      User user = User.fromJson(responseDto.data);
      responseDto.data = user;
    }
    return responseDto; // ResponseDto 응답
  }

  Future<ResponseDto> fetchUserInfo(int id, String jwtToken) async {
    Response response = await httpConnector.get("/s/api/user/$id/userrealname", jwtToken: jwtToken);
    Logger().d("로그인하고 나서 ${response.body}");
    ResponseDto responseDto = toResponseDto(response);

    if (responseDto.httpStatus == "OK") {
      // 통신이 성공했을 때만 파싱을 해줘야 한다.
      responseDto.data = User.fromJson(responseDto.data);
    }
    return responseDto;
  }
}
