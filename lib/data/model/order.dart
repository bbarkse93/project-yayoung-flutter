import 'package:team_project/data/model/camp_field.dart';
import 'package:team_project/data/model/user.dart';

class Order {
  int? id;
  String? checkOutDate;
  String? checkInDate;
  User? user;
  CampField? campField;
  String? createdAt;

  Order(
      {this.id,
      this.checkOutDate,
      this.checkInDate,
      this.user,
      this.campField,
      this.createdAt});

  // 1. Dart 객체를 통신을 위한 Map 형태로 변환
  Map<String, dynamic> toJson() => {
    "id": id,
    "checkOutDate": checkOutDate,
    "checkInDate": checkInDate,
    "user": user,
    "campField": campField,
    "createdAt": createdAt,
  };

// 2. Map 형태로 받아서 Dart 객체로 변환
  Order.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        checkOutDate = json["checkOutDate"],
        checkInDate = json["checkInDate"],
        user = json["user"],
        campField = json["campField"],
        createdAt = json["createdAt"];
}
