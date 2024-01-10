import 'package:team_project/data/model/camp.dart';
import 'package:team_project/data/model/user.dart';

class CampReview{
  int? id;
  String? content;
  String? reviewImage;
  User? user;
  Camp? camp;
  String? createdAt;

  CampReview(
      {this.id,
      this.content,
      this.reviewImage,
      this.user,
      this.camp,
      this.createdAt});

  // 1. Dart 객체를 통신을 위한 Map 형태로 변환
  Map<String, dynamic> toJson() => {
    "id": id,
    "content": content,
    "reviewImage": reviewImage,
    "user": user,
    "camp": camp,
    "createdAt": createdAt,
  };

// 2. Map 형태로 받아서 Dart 객체로 변환
  CampReview.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        content = json["content"],
        reviewImage = json["reviewImage"],
        user = json["user"],
        camp = json["camp"],
        createdAt = json["createdAt"];
}