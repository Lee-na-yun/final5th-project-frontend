import 'package:intl/intl.dart';
import 'user.dart';

class Follow {
  final followId;
  final userId;
  final followingUserId;
  final createdAt;
  final user;

  Follow(this.followId, this.userId, this.followingUserId, this.createdAt, this.user);

  Map<String, dynamic> toJson() => {
        "followId": followId,
        "userId": userId,
        "followingUserId": followingUserId,
        "createdAt": createdAt,
        "users": user
      };

  Follow.fromJson(Map<String, dynamic> json)
      : followId = json["followId"],
        userId = json["userId"],
        followingUserId = json["followingUserId"],
        createdAt = DateFormat("yyyy-mm-dd").parse(json["createdAt"]),
        user = User.fromJson(json["users"]);
}
