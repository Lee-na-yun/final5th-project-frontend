import 'dart:ffi';

import 'package:intl/intl.dart';

import 'user.dart';

class Follow {
  final Long? followId;
  final Long? userId;
  final Long? followingUserId;
  final DateTime? createdAt;
  final User? user;

  Follow(this.followId, this.userId, this.followingUserId, this.createdAt,
      this.user);

  Map<String, dynamic> toJson() => {
        "followId": followId,
        "userId": userId,
        "followingUserId": followingUserId,
        "createdAt": createdAt,
        "user": user
      };

  Follow.fromJson(Map<String, dynamic> json)
      : followId = json["followId"],
        userId = json["userId"],
        followingUserId = json["followingUserId"],
        createdAt = DateFormat("yyyy-mm-dd").parse(json["createdAt"]),
        user = User.fromJson(json["user"]);
}
