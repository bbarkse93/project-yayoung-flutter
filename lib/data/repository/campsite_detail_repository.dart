import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/model/camp.dart';
import 'package:team_project/data/model/campsite_detail.dart';

class CampDetailRepository {

  Future<ResponseDTO> fetchCampDetail(int? id) async {
    try {
      // 통신
      Logger().d("id는? $id");
      Response response = await dio.get("/camp/${id}");
      // 응답 받은 데이터 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d("그만둬 ${responseDTO.response}");

      responseDTO.response = CampsiteDetail.fromJson(responseDTO.response);

      return responseDTO;
    } catch (e) {
      return ResponseDTO(false, "캠핑장 불러오기 실패", null);
    }
  }
}
