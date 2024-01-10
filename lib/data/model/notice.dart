import 'package:team_project/data/model/user.dart';

class Notice {
  int? id;
  String? title;
  String? content;
  User? user;
  String? createdAt;

  Notice({this.id, this.title, this.content, this.user, this.createdAt});

  // 1. Dart 객체를 통신을 위한 Map 형태로 변환
  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "user": user,
        "createdAt": createdAt,
      };

// 2. Map 형태로 받아서 Dart 객체로 변환
  Notice.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        content = json["content"],
        user = json["user"],
        createdAt = json["createdAt"];
}
