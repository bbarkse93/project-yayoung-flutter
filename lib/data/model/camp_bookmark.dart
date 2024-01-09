import 'package:team_project/data/model/camp.dart';
import 'package:team_project/data/model/user.dart';

class CampBookmark{
  int? id;
  User? user;
  Camp? camp;

  CampBookmark({this.id, this.user, this.camp});

  // 1. Dart 객체를 통신을 위한 Map 형태로 변환
  Map<String, dynamic> toJson() => {
    "id": id,
    "user": user,
    "camp": camp,
  };

// 2. Map 형태로 받아서 Dart 객체로 변환
  CampBookmark.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        user = json["user"],
        camp = json["camp"];
}