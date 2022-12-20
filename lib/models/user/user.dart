class User {
  User({
    required this.id,
    required this.username,
    required this.password,
    required this.email,
    required this.role,
    required this.updatedAt,
    required this.createdAt,
  });

  int id;
  String username;
  String password;
  String email;
  String role;
  String updatedAt;
  String createdAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        password: json["password"],
        email: json["email"],
        role: json["role"],
        updatedAt: json["updatedAt"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "password": password,
        "email": email,
        "role": role,
        "updatedAt": updatedAt,
        "createdAt": createdAt,
      };
}
