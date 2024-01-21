import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/data/dto/camp_request_dto.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/model/camp.dart';

class CampListRepository {
  Future<ResponseDTO> fetchCampList() async {
    String jwt =
        "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwcm9qZWN0LWtleSIsImlkIjozLCJ1c2VybmFtZSI6ImpiekhybE9yQ2pSUm5DWGtjZ2trSFdXWXFpWnQzWFFKZHpYVDNxbDhPbTgiLCJleHAiOjQ4NTkxMzgxNjB9.j8pUOQ8WTots0gXL1Ei_ZHWlyqlpf9mdXyvcJ6UNjkfxDyksayuJLcV7zLmO3VS7QMAUop7fWMgstth6ao6_Iw";
    try {
      Logger().d("통신하기 전");

      // 통신
      final response = await dio.get(
        "/camp/list",
        options: Options(headers: {"Authorization": jwt}),
      );

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

  // Future<ResponseDTO> fetchCampList() async {
  //
  //   try {
  //     Logger().d("통신하기 전");
  //
  //     // 통신
  //     final response = await dio.get("/camp/list");
  //     Logger().d("통신완료 ${response.data}");
  //
  //
  //     // ResponseDTO파싱
  //     ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
  //
  //     List<dynamic> mapList = responseDTO.response["campDTO"];
  //     responseDTO.response = mapList.map((e) => Camp.fromJson(e)).toList();
  //
  //     return responseDTO;
  //
  //   } catch (e) {
  //     return ResponseDTO(false, "캠핑장목록 불러오기 실패", null);
  //   }
  // }


  Future<ResponseDTO> fetchCampListFilter(CampListDTO campListDTO) async {
    try {
      Logger().d("필터 통신됨 ${campListDTO.optionNames}");

      // 통신
      final response = await dio.get(
          "/camp/list", queryParameters: campListDTO.toQueryParameters());


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
