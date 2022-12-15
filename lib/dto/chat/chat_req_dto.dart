class ChatInsertReqDto {
  String from;
  String to;
  String msg;
  DateTime createdAt = DateTime.now();

  ChatInsertReqDto({required this.from, required this.to, required this.msg, required this.createdAt});
  // fromJson 하면서 required 붙음

  //dart -> map (toJson)
  Map<String, dynamic> toJson() => {"from": from, "to": to, "msg": msg, "createdAt": createdAt};
  //map -> dart (fromJson)
  factory ChatInsertReqDto.fromJson(Map<String, dynamic> json) =>
      ChatInsertReqDto(from: json["from"], to: json["to"], msg: json["price"], createdAt: json["createdAt"]);
}

//class ChatDeleteReqDto {}
