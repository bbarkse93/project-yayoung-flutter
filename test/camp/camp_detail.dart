import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/data/dto/camp_request_dto.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/model/camp_bookmark_state.dart';
import 'package:team_project/data/model/camp_image.dart';
import 'package:team_project/data/model/campsite_detail.dart';

void main() async {
  CampSaveOrDeleteDTO requestDTO = CampSaveOrDeleteDTO(7);
  await fetchDeleteBookmark(requestDTO);
}

class CampInfo {
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
  List<EnvironmentDTO>? environment;
  List<TypeDTO>? type;
  List<SiteDTO>? site;
  List<MainFacilityDTO>? mainFacility;
  List<HaveFacilityDTO>? haveFacility;
  List<ExerciseFacilityDTO>? exerciseFacility;
  List<ProgramDTO>? program;
  List<SellDTO>? sell;
  List<RentalDTO>? rental;

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
    this.totalRating,
    this.cleanlinessAverage,
    this.managementnessAverage,
    this.friendlinessAverage,
    this.reviewCount,
    this.images,
    this.environment,
    this.type,
    this.site,
    this.mainFacility,
    this.haveFacility,
    this.exerciseFacility,
    this.program,
    this.sell,
    this.rental,
  );

  CampInfo.fromJson(Map<String, dynamic> json)
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
        environment = (json["options"]["environment"] as List<dynamic>? ?? [])
            .map((i) => EnvironmentDTO.fromJson(i))
            .toList(),
        type = (json["options"]["type"] as List<dynamic>? ?? [])
            .map((i) => TypeDTO.fromJson(i))
            .toList(),
        site = (json["options"]["site"] as List<dynamic>? ?? [])
            .map((i) => SiteDTO.fromJson(i))
            .toList(),
        mainFacility =
            (json["options"]["main_facility"] as List<dynamic>? ?? [])
                .map((i) => MainFacilityDTO.fromJson(i))
                .toList(),
        haveFacility =
            (json["options"]["have_facility"] as List<dynamic>? ?? [])
                .map((i) => HaveFacilityDTO.fromJson(i))
                .toList(),
        exerciseFacility =
            (json["options"]["exercise_facility"] as List<dynamic>? ?? [])
                .map((i) => ExerciseFacilityDTO.fromJson(i))
                .toList(),
        program = (json["options"]["program"] as List<dynamic>? ?? [])
            .map((i) => ProgramDTO.fromJson(i))
            .toList(),
        sell = (json["options"]["sell"] as List<dynamic>? ?? [])
            .map((i) => SellDTO.fromJson(i))
            .toList(),
        rental = (json["options"]["rental"] as List<dynamic>? ?? [])
            .map((i) => RentalDTO.fromJson(i))
            .toList();

  @override
  String toString() {
    return 'CampInfo{id: $id, campName: $campName, campAddress: $campAddress, campCallNumber: $campCallNumber, campWebsite: $campWebsite, campRefundPolicy: $campRefundPolicy, campWater: $campWater, campGarbageBag: $campGarbageBag, holiday: $holiday, campCheckIn: $campCheckIn, campCheckOut: $campCheckOut, campFieldImage: $campFieldImage, minPrice: $minPrice, maxPrice: $maxPrice, totalRating: $totalRating, cleanlinessAverage: $cleanlinessAverage, managementnessAverage: $managementnessAverage, friendlinessAverage: $friendlinessAverage, reviewCount: $reviewCount, images: $images, environment: $environment, type: $type, site: $site, mainFacility: $mainFacility, haveFacility: $haveFacility, exerciseFacility: $exerciseFacility, sell: $sell, rental: $rental}';
  }
}

class EnvironmentDTO {
  int? optionId;
  String? optionName;
  int? categoryId;
  String? categoryName;

  EnvironmentDTO({
    this.optionId,
    this.optionName,
    this.categoryId,
    this.categoryName,
  });

  EnvironmentDTO.fromJson(Map<String, dynamic> json)
      : optionId = json["optionId"],
        optionName = json["optionName"],
        categoryId = json["categoryId"],
        categoryName = json["categoryName"];
}

class TypeDTO {
  int? optionId;
  String? optionName;
  int? categoryId;
  String? categoryName;

  TypeDTO({
    this.optionId,
    this.optionName,
    this.categoryId,
    this.categoryName,
  });

  TypeDTO.fromJson(Map<String, dynamic> json)
      : optionId = json["optionId"],
        optionName = json["optionName"],
        categoryId = json["categoryId"],
        categoryName = json["categoryName"];
}

class SiteDTO {
  int? optionId;
  String? optionName;
  int? categoryId;
  String? categoryName;

  SiteDTO({
    this.optionId,
    this.optionName,
    this.categoryId,
    this.categoryName,
  });

  SiteDTO.fromJson(Map<String, dynamic> json)
      : optionId = json["optionId"],
        optionName = json["optionName"],
        categoryId = json["categoryId"],
        categoryName = json["categoryName"];
}

class MainFacilityDTO {
  int? optionId;
  String? optionName;
  int? categoryId;
  String? categoryName;

  MainFacilityDTO({
    this.optionId,
    this.optionName,
    this.categoryId,
    this.categoryName,
  });

  MainFacilityDTO.fromJson(Map<String, dynamic> json)
      : optionId = json["optionId"],
        optionName = json["optionName"],
        categoryId = json["categoryId"],
        categoryName = json["categoryName"];
}

class HaveFacilityDTO {
  int? optionId;
  String? optionName;
  int? categoryId;
  String? categoryName;

  HaveFacilityDTO({
    this.optionId,
    this.optionName,
    this.categoryId,
    this.categoryName,
  });

  HaveFacilityDTO.fromJson(Map<String, dynamic> json)
      : optionId = json["optionId"],
        optionName = json["optionName"],
        categoryId = json["categoryId"],
        categoryName = json["categoryName"];
}

class ExerciseFacilityDTO {
  int? optionId;
  String? optionName;
  int? categoryId;
  String? categoryName;

  ExerciseFacilityDTO({
    this.optionId,
    this.optionName,
    this.categoryId,
    this.categoryName,
  });

  ExerciseFacilityDTO.fromJson(Map<String, dynamic> json)
      : optionId = json["optionId"],
        optionName = json["optionName"],
        categoryId = json["categoryId"],
        categoryName = json["categoryName"];
}

class ProgramDTO {
  int? optionId;
  String? optionName;
  int? categoryId;
  String? categoryName;

  ProgramDTO({
    this.optionId,
    this.optionName,
    this.categoryId,
    this.categoryName,
  });

  ProgramDTO.fromJson(Map<String, dynamic> json)
      : optionId = json["optionId"],
        optionName = json["optionName"],
        categoryId = json["categoryId"],
        categoryName = json["categoryName"];
}

class SellDTO {
  int? optionId;
  String? optionName;
  int? categoryId;
  String? categoryName;

  SellDTO({
    this.optionId,
    this.optionName,
    this.categoryId,
    this.categoryName,
  });

  SellDTO.fromJson(Map<String, dynamic> json)
      : optionId = json["optionId"],
        optionName = json["optionName"],
        categoryId = json["categoryId"],
        categoryName = json["categoryName"];
}

class RentalDTO {
  int? optionId;
  String? optionName;
  int? categoryId;
  String? categoryName;

  RentalDTO({
    this.optionId,
    this.optionName,
    this.categoryId,
    this.categoryName,
  });

  RentalDTO.fromJson(Map<String, dynamic> json)
      : optionId = json["optionId"],
        optionName = json["optionName"],
        categoryId = json["categoryId"],
        categoryName = json["categoryName"];
}

Future<ResponseDTO> fetchCampDetail(int id) async {
  try {
// 통신
    Response response = await dio.get("/camp/${id}");

// 응답 받은 데이터 파싱
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    Logger().d("1차 파싱 ${responseDTO.response}");
    Logger().d("여기까지 실행1");
    responseDTO.response = CampInfo.fromJson(responseDTO.response);
    Logger().d("여기까지 실행2");
    Logger().d("이건 어떻게 나올까? ${responseDTO.response.toString()}");
    responseDTO.response = CampsiteDetail.fromJson(responseDTO.response);
    Logger().d("2차 파싱 ${responseDTO.response.toString()}");

    return responseDTO;
  } catch (e) {
    return ResponseDTO(false, "캠핑장 불러오기 실패", null);
  }
}

Future<ResponseDTO> fetchDeleteBookmark(CampSaveOrDeleteDTO requestDTO) async {
  String jwt = await secureStorage.read(key: 'jwt') as String;

  try {
    // 통신
    Response response = await dio.delete("/camp/bookmark",
        options: Options(headers: {'Authorization': jwt}),
        data: requestDTO.toJson());
    // 응답 받은 데이터 파싱
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    responseDTO.response = CampBookmarkState.fromJson(responseDTO.response);

    return responseDTO;
  } catch (e) {
    return ResponseDTO(false, "북마크 삭제 실패", null);
  }
}
