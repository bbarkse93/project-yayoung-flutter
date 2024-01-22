import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/model/camp.dart';
import 'package:team_project/data/model/refund.dart';
import 'package:team_project/data/repository/campsite_list_repository.dart';
import 'package:team_project/ui/pages/campsite/campsite_list/campsite_list_view_model.dart';

void main() async {

  await fetchRefundPage(1, 1);
}

Future<ResponseDTO> fetchRefundPage(int? campId, int? orderId) async {
  // String jwt = await secureStorage.read(key: 'jwt') as String;

  String jwt = "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwcm9qZWN0LWtleSIsImlkIjoxLCJ1c2VybmFtZSI6bnVsbCwiZXhwIjo0ODU5MDUzNDgyfQ.Ky2-BLYTjxlouBRsY1HScpc3fC3FOhpK0OrCKy3MFFW6KkCC19B2KsZrd9NIYLoeYY1YEB2BQNLT_KjPETTPMw";
  try {
    // 통신
    Logger().d("id는? $campId");
    Response response = await dio.get("/order/refund-info?orderId=$orderId&campId=$campId",
        options: Options(headers: {'Authorization': jwt})
    );
    // 응답 받은 데이터 파싱
    Logger().d("응답 : $response");
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    Logger().d("그만둬 ${responseDTO.response}");
    //
    // responseDTO.response = Refund.fromJson(responseDTO.response);
    // Logger().d("그만둬라 진짜 ${responseDTO.response}");
    return responseDTO;
  } catch (e) {
    return ResponseDTO(false, "캠핑장 불러오기 실패", null);
  }
}
