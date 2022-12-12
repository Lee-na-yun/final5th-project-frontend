import 'dart:ffi';

import 'package:intl/intl.dart';

import 'follow.dart';

class User {
  final Long? userId;
  final String? userName;
  final String? userPassword;
  final String? userRealname;
  final String? userEmail;
  final String? userPhonenumber;
  final String? userImgfile;
  final String? userProfileIntro;
  final DateTime? userCreatedAt;
  final DateTime? userUpdatedAt;
  final String? userWebLink;
  final String? userImageUrl;
  final String? userImageType;
  final String? userImageName;
  final String? userImageUuid;
  final Follow? follow;

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
        follow = Follow.fromJson(json["follow"]),
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
        userImageUuid = json["userImageUuid"];
}
