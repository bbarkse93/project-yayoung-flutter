// // import 'package:team_project/data/model/camp_image.dart';
// // import 'package:team_project/data/model/camp_rating.dart';
// //
import 'package:team_project/data/model/camp_image.dart';
import 'package:team_project/data/model/option.dart';

class CampsiteDetail {
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
  int? minPrice;
  int? maxPrice;
  String? totalRating;
  double? cleanlinessAverage;
  double? managementnessAverage;
  double? friendlinessAverage;
  int? reviewCount;
  List<CampImage>? images;
  List<Option>? options;

  CampsiteDetail(
      {this.id,
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
      this.minPrice,
      this.maxPrice,
      this.totalRating,
      this.cleanlinessAverage,
      this.managementnessAverage,
      this.friendlinessAverage,
      this.reviewCount,
      this.images,
      this.options});

  CampsiteDetail.fromJson(Map<String, dynamic> json)
      : id = json["campInfo"]["id"],
        campName = json["campInfo"]["campName"],
        campAddress = json["campInfo"]["campAddress"],
        campCallNumber = json["campInfo"]["campCallNumber"],
        campWebsite = json["campInfo"]["campWebsite"],
        campRefundPolicy = json["campInfo"]["campRefundPolicy"],
        campWater = json["campInfo"]["campWater"],
        campGarbageBag = json["campInfo"]["campGarbageBag"],
        holiday = json["campInfo"]["holiday"],
        campCheckIn = json["campInfo"]["campCheckIn"],
        campCheckOut = json["campInfo"]["campCheckOut"],
        campFieldImage = json["campInfo"]["campFieldImage"],
        totalRating = json["campInfo"]["totalRating"],
        minPrice = json["campInfo"]["campPrice"]["minPrice"],
        maxPrice = json["campInfo"]["campPrice"]["maxPrice"],
        cleanlinessAverage = json["campRating"]["cleanlinessAverage"],
        managementnessAverage = json["campRating"]["managementnessAverage"],
        friendlinessAverage = json["campRating"]["friendlinessAverage"],
        reviewCount = json["reviewCount"],
        images = (json["images"] as List<dynamic>? ?? [])
            .map((i) => CampImage.fromJson(i))
            .toList(),
        options = (json["options"] as List<dynamic>? ?? [])
            .map((o) => Option.fromJson(o))
            .toList();

  @override
  String toString() {
    return '{id: $id, '
        'campName: $campName, '
        'campAddress: $campAddress, '
        'campCallNumber: $campCallNumber, '
        'campWebsite: $campWebsite, '
        'campRefundPolicy: $campRefundPolicy, '
        'campWater: $campWater, '
        'campGarbageBag: $campGarbageBag, '
        'holiday: $holiday, '
        'campCheckIn: $campCheckIn, '
        'campCheckOut: $campCheckOut, '
        'campFieldImage: $campFieldImage, '
        'minPrice: $minPrice, '
        'maxPrice: $maxPrice, '
        'totalRating: $totalRating, '
        'cleanlinessAverage: $cleanlinessAverage, '
        'managementnessAverage: $managementnessAverage, '
        'friendlinessAverage: $friendlinessAverage, '
        'reviewCount: $reviewCount, '
        'images: $images, '
        'options: $options}';
  }
}

// //
// //
// // =========================================================
// class CampInfo {
//   int? id;
//   String? campName;
//   String? campAddress;
//   String? campCallNumber;
//   String? campWebsite;
//   String? campRefundPolicy;
//   bool? campWater;
//   bool? campGarbageBag;
//   String? holiday;
//   String? campCheckIn;
//   String? campCheckOut;
//   String? campFieldImage;
//   List<CampImage>? campImageList;
//   List<CampRating>? campRatingList;
//   String? campImage;
//   String? campRating;
//
//   CampInfo({
//     this.id,
//     this.campName,
//     this.campAddress,
//     this.campCallNumber,
//     this.campWebsite,
//     this.campRefundPolicy,
//     this.campWater,
//     this.campGarbageBag,
//     this.holiday,
//     this.campCheckIn,
//     this.campCheckOut,
//     this.campFieldImage,
//     this.campImageList,
//     this.campRatingList,
//     this.campImage,
//     this.campRating,
//   });
//
//   factory CampInfo.fromJson(Map<String, dynamic> json) {
//     return CampInfo(
//       id: json["id"],
//       campName: json["campName"],
//       campAddress: json["campAddress"],
//       campCallNumber: json["campCallNumber"],
//       campWebsite: json["campWebsite"],
//       campRefundPolicy: json["campRefundPolicy"],
//       campWater: json["campWater"],
//       campGarbageBag: json["campGarbageBag"],
//       holiday: json["holiday"],
//       campCheckIn: json["campCheckIn"],
//       campCheckOut: json["campCheckOut"],
//       campFieldImage: json["campFieldImage"],
//       campImageList: (json["images"] as List<dynamic>? ?? [])
//           .map((item) => CampImage.fromJson(item))
//           .toList(),
//       campRatingList: (json["campRatingList"] as List<dynamic>? ?? [])
//           .map((e) => CampRating.fromJson(e))
//           .toList(),
//       campImage: json["campImage"],
//       campRating: json["campRating"],
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "campName": campName,
//         "campAddress": campAddress,
//         "campCallNumber": campCallNumber,
//         "campWebsite": campWebsite,
//         "campRefundPolicy": campRefundPolicy,
//         "campWater": campWater,
//         "campGarbageBag": campGarbageBag,
//         "holiday": holiday,
//         "campCheckIn": campCheckIn,
//         "campCheckOut": campCheckOut,
//         "campFieldImage": campFieldImage,
//         "campImageList": campImageList?.map((e) => e.toJson()).toList(),
//         "campRatingList": campRatingList?.map((e) => e.toJson()).toList(),
//         "campImage": campImage,
//         "campRating": campRating,
//       };
// }
//
// class CampPrice {
//   int? minPrice;
//   int? maxPrice;
//
//   CampPrice({
//     this.minPrice,
//     this.maxPrice,
//   });
//
//   factory CampPrice.fromJson(Map<String, dynamic> json) {
//     return CampPrice(
//       minPrice: json["minPrice"],
//       maxPrice: json["maxPrice"],
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//         "minPrice": minPrice,
//         "maxPrice": maxPrice,
//       };
// }
//
// class CampRating {
//   double? cleanlinessAverage;
//   double? managementnessAverage;
//   double? friendlinessAverage;
//
//   CampRating({
//     this.cleanlinessAverage,
//     this.managementnessAverage,
//     this.friendlinessAverage,
//   });
//
//   factory CampRating.fromJson(Map<String, dynamic> json) {
//     return CampRating(
//       cleanlinessAverage: json["cleanlinessAverage"],
//       managementnessAverage: json["managementnessAverage"],
//       friendlinessAverage: json["friendlinessAverage"],
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//         "cleanlinessAverage": cleanlinessAverage,
//         "managementnessAverage": managementnessAverage,
//         "friendlinessAverage": friendlinessAverage,
//       };
// }
//
// class CampImage {
//   int? campImageId;
//   String? campImage;
//
//   CampImage({
//     this.campImageId,
//     this.campImage,
//   });
//
//   factory CampImage.fromJson(Map<String, dynamic> json) {
//     return CampImage(
//       campImageId: json["campImageId"],
//       campImage: json["campImage"],
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//         "campImageId": campImageId,
//         "campImage": campImage,
//       };
// }
// ===============================================================
// class CampInfo {
//   int? id;
//   String? campName;
//   String? campAddress;
//   String? campCallNumber;
//   String? campWebsite;
//   String? campRefundPolicy;
//   bool? campWater;
//   bool? campGarbageBag;
//   String? holiday;
//   String? campCheckIn;
//   String? campCheckOut;
//   String? campFieldImage;
//   String? totalRating;
//   CampPrice? campPrice;
//
//   CampInfo({
//     this.id,
//     this.campName,
//     this.campAddress,
//     this.campCallNumber,
//     this.campWebsite,
//     this.campRefundPolicy,
//     this.campWater,
//     this.campGarbageBag,
//     this.holiday,
//     this.campCheckIn,
//     this.campCheckOut,
//     this.campFieldImage,
//     this.totalRating,
//     this.campPrice,
//   });
//
//   factory CampInfo.fromJson(Map<String, dynamic> json) {
//     return CampInfo(
//       id: json['id'],
//       campName: json['campName'],
//       campAddress: json['campAddress'],
//       campCallNumber: json['campCallNumber'],
//       campWebsite: json['campWebsite'],
//       campRefundPolicy: json['campRefundPolicy'],
//       campWater: json['campWater'],
//       campGarbageBag: json['campGarbageBag'],
//       holiday: json['holiday'],
//       campCheckIn: json['campCheckIn'],
//       campCheckOut: json['campCheckOut'],
//       campFieldImage: json['campFieldImage'],
//       totalRating: json['totalRating'],
//       campPrice: CampPrice.fromJson(json['campPrice']),
//     );
//   }
// }
//
// class CampRating {
//   double cleanlinessAverage;
//   double managementnessAverage;
//   double friendlinessAverage;
//
//   CampRating({
//     required this.cleanlinessAverage,
//     required this.managementnessAverage,
//     required this.friendlinessAverage,
//   });
//
//   factory CampRating.fromJson(Map<String, dynamic> json) {
//     return CampRating(
//       cleanlinessAverage: json['cleanlinessAverage'],
//       managementnessAverage: json['managementnessAverage'],
//       friendlinessAverage: json['friendlinessAverage'],
//     );
//   }
// }
//
// class ReviewCount {
//   int count;
//
//   ReviewCount({
//     required this.count,
//   });
//
//   factory ReviewCount.fromJson(Map<String, dynamic> json) {
//     return ReviewCount(
//       count: json['reviewCount'],
//     );
//   }
// }
//
// class CampImage {
//   int campImageId;
//   String campImage;
//
//   CampImage({
//     required this.campImageId,
//     required this.campImage,
//   });
//
//   factory CampImage.fromJson(Map<String, dynamic> json) {
//     return CampImage(
//       campImageId: json['campImageId'],
//       campImage: json['campImage'],
//     );
//   }
// }
//
// class Option {
//   int optionId;
//   String optionName;
//
//   Option({
//     required this.optionId,
//     required this.optionName,
//   });
//
//   factory Option.fromJson(Map<String, dynamic> json) {
//     return Option(
//       optionId: json['optionId'],
//       optionName: json['optionName'],
//     );
//   }
// }
//
// class CampPrice {
//   int minPrice;
//   int maxPrice;
//
//   CampPrice({
//     required this.minPrice,
//     required this.maxPrice,
//   });
//
//   factory CampPrice.fromJson(Map<String, dynamic> json) {
//     return CampPrice(
//       minPrice: json['minPrice'],
//       maxPrice: json['maxPrice'],
//     );
//   }
// }
