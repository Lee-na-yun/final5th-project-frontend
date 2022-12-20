class JoinReqDto {
  final String username;
  final String password;
  final String email;
  final String fullname;

  JoinReqDto({
    required this.username,
    required this.password,
    required this.email,
    required this.fullname,
  });

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "password": password,
      "email": email,
      "fullname": fullname
    };
  }
}

class LoginReqDto {
  final String username;
  final String password;

  LoginReqDto({required this.username, required this.password});

  Map<String, dynamic> toJson() {
    return {"username": username, "password": password};
  }
}
