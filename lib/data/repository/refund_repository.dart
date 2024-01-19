import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/data/dto/refund_request_dto.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/model/refund.dart';

class RefundRepository {
  Future<ResponseDTO> fetchRefundPage(int? campId, int? orderId) async {
    try {
      // 통신
      Logger().d("id는? $campId");
      Response response = await dio.get("/order/refund-info?orderId=$orderId&campId=$campId");
      // 응답 받은 데이터 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d("그만둬 ${responseDTO.response}");

      responseDTO.response = Refund.fromJson(responseDTO.response);
      Logger().d("그만둬라 진짜 ${responseDTO.response}");
      return responseDTO;
    } catch (e) {
      return ResponseDTO(false, "캠핑장 불러오기 실패", null);
    }
  }

  Future<ResponseDTO> fetchRefund(RefundReqDTO dto) async {
    String jwt =
        "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwcm9qZWN0LWtleSIsImlkIjozLCJ1c2VybmFtZSI6ImpiekhybE9yQ2pSUm5DWGtjZ2trSFdXWXFpWnQzWFFKZHpYVDNxbDhPbTgiLCJleHAiOjQ4NTkxMzgxNjB9.j8pUOQ8WTots0gXL1Ei_ZHWlyqlpf9mdXyvcJ6UNjkfxDyksayuJLcV7zLmO3VS7QMAUop7fWMgstth6ao6_Iw";
    try {
      Logger().d("=================1번");
      Response response = await dio.post(
        "/user/refund",
        data: dto.toJson(),
        options: Options(headers: {"Authorization": "${jwt}"}),
      );
      // );

      Logger().d("$response");

      ResponseDTO responseDTO = new ResponseDTO.fromJson(response.data);
      return responseDTO;
    } catch (e) {
      Logger().d("dio 통신 돼? ${e.toString()}");
      return new ResponseDTO(false, "통신실패", null);
    }
  }

}
