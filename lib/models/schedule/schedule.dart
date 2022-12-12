import 'dart:ffi';

class Schedule {
  final Long? scheduleId;
  final Long? userId;
  final Long? categoryId;
  final String? scheduleTitle;
  final DateTime? scheduleCreatedAt;
  final DateTime? scheduleStartAt;
  final DateTime? scheduleFinishAt;
  final String? scheduleLocation;
  final String? scheduleContent;
  final String? scheduleNote;
  final String? field;

  Schedule(
      this.scheduleId,
      this.userId,
      this.categoryId,
      this.scheduleTitle,
      this.scheduleCreatedAt,
      this.scheduleStartAt,
      this.scheduleFinishAt,
      this.scheduleLocation,
      this.scheduleContent,
      this.scheduleNote,
      this.field);

  Map<String, dynamic> toJson() => {
        "scheduleId": scheduleId,
        "userId": userId,
        "categoryId": categoryId,
        "scheduleTitle": scheduleTitle,
        "scheduleCreatedAt": scheduleCreatedAt,
        "scheduleStartAt": scheduleStartAt,
        "scheduleFinishAt": scheduleFinishAt,
        "scheduleLocation": scheduleLocation,
        "scheduleContent": scheduleContent,
        "scheduleNote": scheduleNote,
        "field": field
      };

  Schedule.fromJson(Map<String, dynamic> json)
      : scheduleId = json["scheduleId"],
        userId = json["userId"],
        categoryId = json["categoryId"],
        scheduleTitle = json["scheduleTitle"],
        scheduleCreatedAt = json["scheduleCreatedAt"],
        scheduleStartAt = json["scheduleStartAt"],
        scheduleFinishAt = json["scheduleFinishAt"],
        scheduleLocation = json["scheduleLocation"],
        scheduleContent = json["scheduleContent"],
        scheduleNote = json["scheduleNote"],
        field = json["field"];
}
