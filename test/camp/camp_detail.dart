

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/model/camp.dart';
import 'package:team_project/data/repository/campsite_detail_repository.dart';

void main() async {

  await notifyInit(1);
}

Future<void> notifyInit(int id) async {
  Logger().d("통신 시작한당");

  ResponseDTO responseDTO = await CampDetailRepository().fetchCampDetail(id);
  Logger().d("통신 끝났당 $responseDTO");
}

Future<ResponseDTO> fetchCampDetail(int id) async {
  try {
    // 통신
    Response response = await dio.get("/camp/${id}");
    print("응답 완료");
    // 응답 받은 데이터 파싱
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    Logger().d("그만둬 ${responseDTO.response}");
    responseDTO.response = Camp.fromJson(responseDTO.response);
    Logger().d("그만둬2 ${responseDTO.response}");
    return responseDTO;
  } catch (e) {
    return ResponseDTO(false, "캠핑장 불러오기 실패", null);
  }
}
