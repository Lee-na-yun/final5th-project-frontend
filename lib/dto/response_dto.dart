class ResponseDto {
  final dynamic httpStatus;
  final String? msg;
  dynamic data;

  ResponseDto({
    this.httpStatus,
    this.msg,
    this.data,
  });

  ResponseDto.fromJson(Map<String, dynamic> json)
      : httpStatus = json["httpStatus"],
        msg = json["msg"],
        data = json["data"];
}
