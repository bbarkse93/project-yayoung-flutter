import 'package:team_project/data/model/camp_image.dart';
import 'package:team_project/data/model/camp_rating.dart';

class Camp {
  int? id;
  String? campName;
  String? campAddress;
  String? campCallNumber;
  String? campWebsite;
  String? campRefundPolicy;
  bool? campWater;
  bool? campGarbageBag;
  String? holiday;
  String? campCheckIn;
  String? campCheckOut;
  String? campFieldImage;
  String? campImage;
  String? campRating;
  List<CampImage>? campImageList;
  List<CampRating>? campRatingList;

  Camp({
    this.id,
    this.campName,
    this.campAddress,
    this.campCallNumber,
    this.campWebsite,
    this.campRefundPolicy,
    this.campWater,
    this.campGarbageBag,
    this.holiday,
    this.campCheckIn,
    this.campCheckOut,
    this.campFieldImage,
    this.campImage,
    this.campRating,
    this.campImageList,
    this.campRatingList,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "campName": campName,
        "campAddress": campAddress,
        "campCallNumber": campCallNumber,
        "campWebsite": campWebsite,
        "campRefundPolicy": campRefundPolicy,
        "campWater": campWater,
        "campGarbageBag": campGarbageBag,
        "holiday": holiday,
        "campCheckIn": campCheckIn,
        "campCheckOut": campCheckOut,
        "campFieldImage": campFieldImage,
        "campImage": campImage,
        "campRating": campRating,
        "campImageList": campImageList,
        "campRatingList": campRatingList,
      };

  Camp.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        campName = json["campName"],
        campAddress = json["campAddress"],
        campCallNumber = json["campCallNumber"],
        campWebsite = json["campWebsite"],
        campRefundPolicy = json["campRefundPolicy"],
        campWater = json["campWater"],
        campGarbageBag = json["campGarbageBag"],
        holiday = json["holiday"],
        campCheckIn = json["campCheckIn"],
        campCheckOut = json["campCheckOut"],
        campFieldImage = json["campFieldImage"],
        campImage = json["campImage"],
        campRating = json["campRating"],
        campImageList = (json["campImageList"] as List<dynamic>? ?? [])
            .map((item) => CampImage.fromJson(item))
            .toList(),
        campRatingList = (json["campRatingList"] as List<dynamic>? ?? [])
            .map((e) => CampRating.fromJson(e))
            .toList();
}
