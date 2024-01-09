class OptionCategory {
  int? id;
  String? categoryName;

  OptionCategory({this.id, this.categoryName});

  // 1. Dart 객체를 통신을 위한 Map 형태로 변환
  Map<String, dynamic> toJson() => {
        "id": id,
        "categoryName": categoryName,
      };

// 2. Map 형태로 받아서 Dart 객체로 변환
  OptionCategory.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        categoryName = json["categoryName"];
}
