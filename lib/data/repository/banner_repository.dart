import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/model/banner.dart';

class BannerRepository {

  Future<ResponseDTO> fetchBanner() async {
    try {
      // 통신
      Logger().d("진입");
      Response response = await dio.get("/camp/banner");
      // 응답 받은 데이터 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d("1차 파싱 : ${responseDTO.response}");
      List<dynamic> mapList = responseDTO.response["bannerList"];
      responseDTO.response = mapList.map((e) => Banner.fromJson(e)).toList();
      Logger().d("2차파싱 : ${responseDTO.response}");
      return responseDTO;
    } catch (e) {
      return ResponseDTO(false, "캠핑장 불러오기 실패", null);
    }
  }
}
