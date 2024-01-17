import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/ui/pages/my_camping_schedule/my_camping_schedule_view_model.dart';

class MyCampingScheduleRepository {
  Future<ResponseDTO> fetchMyCampingSchedule(String jwt) async {
    try {
      final response = await dio.get("/order/campSchedule"
      ,options: Options(headers: {"Authorization": jwt}),);
      Logger().d("response는 ?? $response");

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      if (responseDTO.success) {
        dynamic responseData = responseDTO.response;

        if (responseData is Map<String, dynamic> &&
            responseData.containsKey('campScheduleDTOs')) {
          List<dynamic> campScheduleDTOs =
          responseData['campScheduleDTOs'] as List<dynamic>;
          List<MyCampingScheduleDTO> campingScheduleList =
          campScheduleDTOs.map((e) => MyCampingScheduleDTO.fromJson(e)).toList();
          responseDTO.response = MyCampingScheduleModel(campingScheduleList);
        } else {
          Logger().e(
              "통신 에러: 'campScheduleDTOs' 키를 찾을 수 없거나 유효하지 않은 데이터 구조입니다.");
          responseDTO = ResponseDTO(false, "유효하지 않은 데이터 구조", null);
        }
      }
      return responseDTO;
    } catch (e) {
      Logger().e("통신 에러: $e");
      return ResponseDTO(false, "캠핑장 목록 불러오기 실패: $e", null);
    }
  }
}