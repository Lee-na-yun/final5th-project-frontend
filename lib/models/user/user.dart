import 'package:intl/intl.dart';
//
// class User {
//   final int id;
//   final String username;
//   final String email;
//   final DateTime created;
//   final DateTime updated;
//
//   User({
//     required this.id,
//     required this.username,
//     required this.email,
//     required this.created,
//     required this.updated,
//   });
//
//   // 통신을 위해서 json 처럼 생긴 문자열 {"id":1} => Dart 오브젝트
//   Map<String, dynamic> toJson() =>
//       {"id": id, "username": username, "email": email, "created": created, "updated": updated};
//
//   User.fromJson(Map<String, dynamic> json)
//       : id = json["id"],
//         username = json["username"],
//         email = json["email"],
//         created = DateFormat("yyyy-mm-dd").parse(json["created"]),
//         updated = DateFormat("yyyy-mm-dd").parse(json["updated"]);
// }

import 'dart:ffi';

import 'package:intl/intl.dart';

import 'follow.dart';
/*
class User {
  final Long userId;
  final String userName;
  final String userPassword;
  final String userRealname;
  final String userEmail;
  final String userPhonenumber;
  final String userImgfile;
  final String userProfileIntro;
  final DateTime userCreatedAt;
  final DateTime userUpdatedAt;
  final String userWebLink;
  final String userImageUrl;
  final String userImageType;
  final String userImageName;
  final String userImageUuid;
  final Follow follow;

  User(
      this.userId,
      this.userName,
      this.userPassword,
      this.userRealname,
      this.userEmail,
      this.userPhonenumber,
      this.userImgfile,
      this.userProfileIntro,
      this.userCreatedAt,
      this.userUpdatedAt,
      this.userWebLink,
      this.userImageUrl,
      this.userImageType,
      this.userImageName,
      this.userImageUuid,
      this.follow);

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "userName": userName,
        "userPassword": userPassword,
        "userRealname": userRealname,
        "userEamil": userEmail,
        "userPhonenumber": userPhonenumber,
        "userImgfile": userImgfile,
        "userProfileIntro": userProfileIntro,
        "userCreatedAt": userCreatedAt,
        "userUpdatedAt": userUpdatedAt,
        "userWebLink": userWebLink,
        "userImageUrl": userImageUrl,
        "userImageName": userImageName,
        "userImageType": userImageType,
        "userImageUuid": userImageUuid,
        "follow": follow
      };
  User.fromJson(Map<String, dynamic> json)
      : userId = json["userId"],
        userName = json["userName"],
        userPassword = json["userPassword"],
        userRealname = json["userRealname"],
        userEmail = json["userEmail"],
        userPhonenumber = json["userPhonenumber"],
        userImgfile = json["userImgfile"],
        userProfileIntro = json["userProfileIntro"],
        userCreatedAt = DateFormat("yyyy-mm-dd").parse(json["userCreatedAt"]),
        userUpdatedAt = DateFormat("yyyy-mm-dd").parse(json["userUpdatedAt"]),
        userWebLink = json["userWebLink"],
        userImageUrl = json["userImageUrl"],
        userImageName = json["userImageName"],
        userImageType = json["userImageType"],
        userImageUuid = json["userImageUuid"],
        follow = Follow.fromJson(json["follow"]);
}*/

class User {
  final dynamic? userId;
  final String? userName;

  User(this.userId, this.userName);

  Map<String, dynamic> toJson() => {"userId": userId, "userRealname": userName};
  User.fromJson(Map<String, dynamic> json)
      : userId = json["userId"],
        userName = json["userRealname"];
}
