import 'package:team_project/data/model/camp.dart';
import 'package:team_project/data/model/option.dart';

class OptionManagement {
  int? id;
  Camp? camp;
  Option? option;

  OptionManagement({this.id, this.camp, this.option});

  // 1. Dart 객체를 통신을 위한 Map 형태로 변환
  Map<String, dynamic> toJson() => {
    "id": id,
    "camp": camp,
    "option": option,
  };

// 2. Map 형태로 받아서 Dart 객체로 변환
  OptionManagement.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        camp = json["camp"],
        option = json["option"];
}
