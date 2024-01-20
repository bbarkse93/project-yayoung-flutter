import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/data/dto/camp_request_dto.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/model/camp.dart';

class CampListRepository {
  Future<ResponseDTO> fetchCampList(String jwt) async {

    try {
      Logger().d("통신하기 전");

      // 통신
      final response = await dio.get("/camp/list", options: Options(headers: {'Authorization': jwt}));
      Logger().d("통신완료 ${response.data}");


      // ResponseDTO파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      List<dynamic> mapList = responseDTO.response["campDTO"];
      responseDTO.response = mapList.map((e) => Camp.fromJson(e)).toList();

      return responseDTO;

    } catch (e) {
      return ResponseDTO(false, "캠핑장목록 불러오기 실패", null);
    }
  }


  Future<ResponseDTO> fetchCampListFilter(CampListDTO campListDTO, String jwt) async {
    try {
      Logger().d("필터 통신됨 ${campListDTO.optionNames}");

      // 통신
      final response = await dio.get(
          "/camp/list", queryParameters: campListDTO.toQueryParameters(), options: Options(headers: {'Authorization': jwt}));


      // ResponseDTO파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      List<dynamic> mapList = responseDTO.response["campDTO"];
      responseDTO.response = mapList.map((e) => Camp.fromJson(e)).toList();
      return responseDTO;

    } catch (e) {
      return ResponseDTO(false, "캠핑장목록 불러오기 실패", null);
    }
  }


  Future<ResponseDTO> fetchSearchCamp(String keyword, String jwt) async {
    try {

      // 통신
      final response = await dio.get("/camp/search?keyword=$keyword", options: Options(headers: {'Authorization': jwt}));
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
