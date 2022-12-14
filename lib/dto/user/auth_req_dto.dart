class JoinReqDto {
  final String userName;
  final String userPassword;
  final String userEmail;
  final String userPhonenumber;
  final String userRealname;

  JoinReqDto({
    required this.userName,
    required this.userPassword,
    required this.userEmail,
    required this.userPhonenumber,
    required this.userRealname,
  });

  Map<String, dynamic> toJson() {
    return {
      "userName": userName,
      "userPassword": userPassword,
      "userEmail": userEmail,
      "userPhonenumber": userPhonenumber,
      "userRealname": userRealname,
    };
  }
}

class LoginReqDto {
  final String userName;
  final String userPassword;

  LoginReqDto({required this.userName, required this.userPassword});

  Map<String, dynamic> toJson() {
    return {"userName": userName, "userPassword": userPassword};
  }
}
