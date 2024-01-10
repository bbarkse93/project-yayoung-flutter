import 'package:team_project/data/model/option_category.dart';

class Option {
  int? id;
  String? optionName;
  OptionCategory? optionCategory;

  Option({this.id, this.optionName, this.optionCategory});

  // 1. Dart 객체를 통신을 위한 Map 형태로 변환
  Map<String, dynamic> toJson() => {
    "id": id,
    "optionName": optionName,
    "optionCategory": optionCategory,
  };

// 2. Map 형태로 받아서 Dart 객체로 변환
  Option.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        optionName = json["optionName"],
        optionCategory = json["optionCategory"];
}
