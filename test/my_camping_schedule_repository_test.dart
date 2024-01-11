import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/model/my_camping.dart';
import 'package:team_project/ui/pages/my_camping_schedule/my_camping_schedule_view_model.dart';

void main() async {
  await notifyInit();
}

Future<void> notifyInit() async {
  Logger().d("화면 초기화");
  ResponseDTO responseDTO = await fetchMyCampingSchedule();
  Logger().d(responseDTO); // 이 부분에서 Future 객체가 아니라 실제 결과를 기다림
  print("노티파이 이닛 탈출");
}

Future<ResponseDTO> fetchMyCampingSchedule() async {
  try {
    final response = await dio.get("/order/campSchedule");
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
