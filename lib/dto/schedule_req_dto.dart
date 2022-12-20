class ScheduleReqDto {
  ScheduleReqDto({
    required this.title,
    required this.note,
    required this.address,
    required this.categoryName,
    required this.startAt,
    required this.finishAt,
  });

  String title;
  String note;
  String address;
  String categoryName;
  DateTime startAt;
  DateTime finishAt;

  factory ScheduleReqDto.fromJson(Map<String, dynamic> json) => ScheduleReqDto(
        title: json["title"],
        note: json["note"],
        address: json["address"],
        categoryName: json["categoryName"],
        startAt: DateTime.parse(json["startAt"]),
        finishAt: DateTime.parse(json["finishAt"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "note": note,
        "address": address,
        "categoryName": categoryName,
        "startAt": startAt.toIso8601String(),
        "finishAt": finishAt.toIso8601String(),
      };
}
