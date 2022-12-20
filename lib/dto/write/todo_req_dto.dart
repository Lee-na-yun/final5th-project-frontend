class TodoReqDto {
  final String title;

  TodoReqDto({required this.title});

  Map<String, dynamic> toJson() {
    return {"title": title};
  }
}
