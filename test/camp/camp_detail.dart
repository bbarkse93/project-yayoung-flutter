import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/model/camp.dart';
import 'package:team_project/data/model/camp_field.dart';
import 'package:team_project/data/model/campsite_detail.dart';
import 'package:team_project/data/repository/campsite_detail_repository.dart';

void main() async {
  await fetchCampDetail(1);
}

class CampInfo {
  int id;
  String campName;
  String campAddress;
  String campCallNumber;
  String campWebsite;
  String campRefundPolicy;
  bool campWater;
  bool campGarbageBag;
  String holiday;
  String campCheckIn;
  String campCheckOut;
  String campFieldImage;
  int minPrice;
  int maxPrice;
  String totalRating;

  CampInfo(
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
      this.minPrice,
      this.maxPrice,
      this.totalRating);

  CampInfo.fromJson(Map<String, dynamic> json)
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
        minPrice = json["campPrice"]["minPrice"],
        maxPrice = json["campPrice"]["maxPrice"],
        totalRating = json["totalRating"];

  @override
  String toString() {
    return '{id: $id, campName: $campName, campAddress: $campAddress, campCallNumber: $campCallNumber, campWebsite: $campWebsite, campRefundPolicy: $campRefundPolicy, campWater: $campWater, campGarbageBag: $campGarbageBag, holiday: $holiday, campCheckIn: $campCheckIn, campCheckOut: $campCheckOut, campFieldImage: $campFieldImage, minPrice: $minPrice, maxPrice: $maxPrice, totalRating: $totalRating}';
  }
}

Future<ResponseDTO> fetchCampDetail(int id) async {
  try {
    // 통신
    Response response = await dio.get("/camp/${id}");

    // 응답 받은 데이터 파싱
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    Logger().d("그만둬 ${responseDTO.response}");
    Logger().d("여기까지 실행");

    responseDTO.response = CampsiteDetail.fromJson(responseDTO.response);
    Logger().d("그만둬2 ${responseDTO.response.toString()}");

    return responseDTO;
  } catch (e) {
    return ResponseDTO(false, "캠핑장 불러오기 실패", null);
  }
}
