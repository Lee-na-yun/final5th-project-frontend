import 'dart:ffi';

class Category {
  final Long? categoryId;
  final String? categoryColor;
  final String? categoryName;
  final Long? userId;

  Category(this.categoryId, this.categoryColor, this.categoryName, this.userId);

  Map<String, dynamic> toJson() => {
        "categoryId": categoryId,
        "categoryColor": categoryColor,
        "categoryName": categoryName,
        "userId": userId
      };

  Category.fromJson(Map<String, dynamic> json)
      : categoryId = json["categoryId"],
        categoryColor = json["categoryColor"],
        categoryName = json["categoryName"],
        userId = json["userId"];
}
