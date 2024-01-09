import 'package:team_project/data/model/camp.dart';

class CampField {
  int? id;
  String? fieldName;
  String? price;
  Camp? camp;

  CampField({this.id, this.fieldName, this.price, this.camp});

  // 1. Dart 객체를 통신을 위한 Map 형태로 변환
  Map<String, dynamic> toJson() => {
    "id": id,
    "fieldName": fieldName,
    "price": price,
    "camp": camp,
  };

// 2. Map 형태로 받아서 Dart 객체로 변환
  CampField.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        fieldName = json["fieldName"],
        price = json["price"],
        camp = json["camp"];
}
