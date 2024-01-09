class BoardCategory {
  int? id;
  String? title;

  BoardCategory({this.id, this.title});

  // 1. Dart 객체를 통신을 위한 Map 형태로 변환
  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
  };

// 2. Map 형태로 받아서 Dart 객체로 변환
  BoardCategory.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"];
}