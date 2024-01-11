import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/model/camp.dart';

class CampListRepository {

  Future<ResponseDTO> fetchCampList() async {
    try {

      print("통신 시작");
      // 통신
      final response = await dio.get("/camp/list");
      Logger().d("response는 ?? $response");
      // ResponseDTO파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      // ResponseDTO의 data 파싱
      List<dynamic> mapList = responseDTO.response as List<dynamic>;
      List<Camp> campList =
      mapList.map((e) => Camp.fromJson(e)).toList();

      // 파싱된 데이터를 공통DTO로 덮어씌우기
      responseDTO.response = campList;

      return responseDTO;
    } catch (e) {
      return ResponseDTO(false, "캠핑장목록 불러오기 실패", null);
    }
  }

}