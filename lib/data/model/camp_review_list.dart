// // import 'package:team_project/data/model/camp_image.dart';
// // import 'package:team_project/data/model/camp_rating.dart';
// //
import 'package:team_project/data/model/camp_image.dart';
import 'package:team_project/data/model/camp_review.dart';
import 'package:team_project/data/model/option.dart';

class CampReviewList {
  List<CampReviewDTO>? campReviewList;
  int? campId;
  String? campName;
  int? campReviewCount;

  CampReviewList({
    this.campReviewList,
    this.campId,
    this.campName,
    this.campReviewCount,
  });

  CampReviewList.fromJson(Map<String, dynamic> json)
      : campReviewList = (json["campReviewDTO"] as List<dynamic>? ?? [])
            .map((i) => CampReviewDTO.fromJson(i))
            .toList(),
        campId = json["campId"],
        campName = json["campName"],
        campReviewCount = json["campReviewCount"];

  @override
  String toString() {
    return 'CampReviewList{campReviewList: $campReviewList, campName: $campName, campReviewCount: $campReviewCount}';
  }
}

class CampReviewDTO {
  int? id;
  String? content;
  double? cleanliness;
  double? managementness;
  double? friendliness;
  String? nickname;
  String? userImage;
  double? totalRating;
  String? createdAt;

  CampReviewDTO({
    this.id,
    this.content,
    this.cleanliness,
    this.managementness,
    this.friendliness,
    this.nickname,
    this.userImage,
    this.totalRating,
    this.createdAt,
  });

  CampReviewDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        content = json["content"],
        cleanliness = json["cleanliness"],
        managementness = json["managementness"],
        friendliness = json["friendliness"],
        nickname = json["nickname"],
        userImage = json["userImage"],
        totalRating = json["totalRating"],
        createdAt = json["createdAt"];

  @override
  String toString() {
    return 'CampReviewDTO{id: $id, content: $content, cleanliness: $cleanliness, managementness: $managementness, friendliness: $friendliness, nickname: $nickname, userImage: $userImage, createdAt: $createdAt}';
  }
}
