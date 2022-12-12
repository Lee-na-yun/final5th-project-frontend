import 'dart:ffi';

class News {
  final Long? newsId;
  final Long? targetUserId;
  final Long? userId;
  final Long? scheduleId;
  final Long? commentsId;
  final Long? followId;

  News(this.newsId, this.targetUserId, this.userId, this.scheduleId,
      this.commentsId, this.followId);

  Map<String, dynamic> toJson() => {
        "newsId": newsId,
        "targetUserId": targetUserId,
        "userId": userId,
        "scheduleId": scheduleId,
        "commentsId": commentsId,
        "followId": followId,
      };

  News.fromJson(Map<String, dynamic> json)
      : newsId = json["newsId"],
        targetUserId = json["targetUserId"],
        userId = json["userId"],
        scheduleId = json["scheduleId"],
        commentsId = json["commentsId"],
        followId = json["followId"];
}
