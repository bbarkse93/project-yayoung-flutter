import 'package:team_project/data/model/camp.dart';

class CampImage {
  int? campImageId;
  String? campImage;
  Camp? camp;

  CampImage({
    this.campImageId,
    this.campImage,
    this.camp,
  });

  // Dart 객체를 통신을 위한 Map 형태로 변환
  Map<String, dynamic> toJson() => {
        "campImageId": campImageId,
        "campImage": campImage,
        "camp": camp,
      };

  // Map 형태로 받아서 Dart 객체로 변환
  CampImage.fromJson(Map<String, dynamic> json)
      : campImageId = json["campImageId"],
        campImage = json["campImage"],
        camp = json["camp"];
}
