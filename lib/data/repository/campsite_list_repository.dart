import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/model/camp.dart';

class CampListRepository {
  Future<ResponseDTO> fetchCampList() async {
    try {

      // 통신
      final response = await dio.get("/camp/list");

      // ResponseDTO파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      List<dynamic> mapList = responseDTO.response["campDTO"];
      responseDTO.response = mapList.map((e) => Camp.fromJson(e)).toList();

      return responseDTO;

    } catch (e) {
      return ResponseDTO(false, "캠핑장목록 불러오기 실패", null);
    }
  }
  Future<ResponseDTO> fetchSearchCamp(String keyword) async {
    try {

      // 통신
      final response = await dio.get("/camp/search?keyword=$keyword");
      Logger().d("response는? : $response");
      // ResponseDTO파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d("responseDTO는? : ${responseDTO.response}");
      List<dynamic> mapList = responseDTO.response["campList"];
      responseDTO.response = mapList.map((e) => Camp.fromJson(e)).toList();
      Logger().d("이까지");
      return responseDTO;

    } catch (e) {
      return ResponseDTO(false, "캠핑장목록 불러오기 실패", null);
    }
  }

}
