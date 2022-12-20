class ScheduleHome {
  ScheduleHome({
    required this.schedules,
    required this.todos,
    required this.followingUser,
  });

  List<Schedule> schedules;
  List<Todo> todos;
  List<User> followingUser;

  factory ScheduleHome.fromJson(Map<String, dynamic> json) => ScheduleHome(
        schedules: List<Schedule>.from(
            json["schedules"].map((x) => Schedule.fromJson(x))),
        todos: List<Todo>.from(json["todos"].map((x) => Todo.fromJson(x))),
        followingUser:
            List<User>.from(json["followingUser"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "schedules": List<dynamic>.from(schedules.map((x) => x.toJson())),
        "todos": List<dynamic>.from(todos.map((x) => x.toJson())),
        "followingUser":
            List<dynamic>.from(followingUser.map((x) => x.toJson())),
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

class Schedule {
  Schedule({
    required this.id,
    required this.title,
    required this.note,
    required this.address,
    required this.imgUrl,
    required this.category,
    required this.startAt,
    required this.finishAt,
    required this.user,
    required this.updatedAt,
    required this.createdAt,
  });

  int id;
  String title;
  String note;
  String address;
  String imgUrl;
  Category category;
  DateTime startAt;
  DateTime finishAt;
  User user;
  DateTime updatedAt;
  DateTime createdAt;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        id: json["id"],
        title: json["title"],
        note: json["note"],
        address: json["address"],
        imgUrl: json["imgUrl"],
        category: Category.fromJson(json["category"]),
        startAt: DateTime.parse(json["startAt"]),
        finishAt: DateTime.parse(json["finishAt"]),
        user: User.fromJson(json["user"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "note": note,
        "address": address,
        "imgUrl": imgUrl,
        "category": category.toJson(),
        "startAt": startAt.toIso8601String(),
        "finishAt": finishAt.toIso8601String(),
        "user": user.toJson(),
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
      };
}

class Category {
  Category({
    required this.id,
    required this.color,
    required this.name,
    required this.updatedAt,
    required this.createdAt,
  });

  int id;
  String color;
  String name;
  DateTime updatedAt;
  DateTime createdAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        color: json["color"],
        name: json["name"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "color": color,
        "name": name,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
      };
}

class Todo {
  Todo({
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

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
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
