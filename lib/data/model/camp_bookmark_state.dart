import 'package:team_project/data/model/camp.dart';

class CampBookmarkState {
  bool bookmark;

  CampBookmarkState(this.bookmark); // 1. Dart 객체를 통신을 위한 Map 형태로 변환

  Map<String, dynamic> toJson() => {
    "bookmark": bookmark,
  };

// 2. Map 형태로 받아서 Dart 객체로 변환
  CampBookmarkState.fromJson(Map<String, dynamic> json)
      : bookmark = json["bookmark"];
}
