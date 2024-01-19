import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/model/reservation.dart';
import 'package:team_project/ui/pages/reservation/reservation_view_model.dart';

class ReservationRepository {
  Future<ResponseDTO> fetchReservation(int? campId) async {
    String jwt = await secureStorage.read(key: 'jwt') as String;

    try {
      // 통신
      Logger().d("id는? $campId");
      Response response = await dio.get("/order/field-list?campId=$campId",
          options: Options(headers: {"Authorization": jwt})
      );
      // 응답 받은 데이터 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d("그만둬 ${responseDTO.response}");

      responseDTO.response = Reservation.fromJson(responseDTO.response);
      Logger().d("그만둬라 진짜 ${responseDTO.response}");
      return responseDTO;
    } catch (e) {
      return ResponseDTO(false, "캠핑장 불러오기 실패", null);
    }
  }

  // void updateCheckbox(CampFieldDTO campFieldDTO) {
  //   try {
  //     campFieldDTO.isChecked = !campFieldDTO.isChecked;
  //   } catch (e) {
  //     print("Checkbox 업데이트 실패: $e");
  //     rethrow;
  //   }
  // }
}
