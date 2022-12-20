class TodoWrite {
  TodoWrite({
    required this.id,
    required this.title,
    required this.isFinished,
    required this.user,
    required this.updatedAt,
    required this.createdAt,
  });

  int id;
  String title;
  bool isFinished;
  User user;
  DateTime updatedAt;
  DateTime createdAt;

  factory TodoWrite.fromJson(Map<String, dynamic> json) => TodoWrite(
        id: json["id"],
        title: json["title"],
        isFinished: json["isFinished"],
        user: User.fromJson(json["user"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "isFinished": isFinished,
        "user": user.toJson(),
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
      };
}

class User {
  User({
    required this.id,
    required this.username,
    required this.password,
    required this.email,
    required this.fullname,
    required this.role,
    required this.updatedAt,
    required this.createdAt,
  });

  int id;
  String username;
  String password;
  String email;
  String fullname;
  String role;
  DateTime updatedAt;
  DateTime createdAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        password: json["password"],
        email: json["email"],
        fullname: json["fullname"],
        role: json["role"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "password": password,
        "email": email,
        "fullname": fullname,
        "role": role,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
      };
}
