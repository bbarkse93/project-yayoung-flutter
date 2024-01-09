import 'package:team_project/data/model/camp.dart';
import 'package:team_project/data/model/user.dart';

class CampRating{
  int? id;
  double? cleanliness;
  double? managementness;
  double? friendliness;
  User? user;
  Camp? camp;

  CampRating(
      {this.id,
      this.cleanliness,
      this.managementness,
      this.friendliness,
      this.user,
      this.camp});

  // 1. Dart 객체를 통신을 위한 Map 형태로 변환
  Map<String, dynamic> toJson() => {
    "id": id,
    "cleanliness": cleanliness,
    "managementness": managementness,
    "friendliness": friendliness,
    "user": user,
    "camp": camp,
  };

// 2. Map 형태로 받아서 Dart 객체로 변환
  CampRating.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        cleanliness = json["cleanliness"],
        managementness = json["managementness"],
        friendliness = json["friendliness"],
        user = json["user"],
        camp = json["camp"];
}