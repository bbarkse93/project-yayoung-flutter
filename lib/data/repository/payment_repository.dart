import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/data/dto/payment_request_dto.dart';
import 'package:team_project/data/dto/response_dto.dart';

class PaymentRepository {
  Future<ResponseDTO> fetchPayment(PaymentReqDTO dto) async {
    //TODO 언약 : 토큰 로직 추가
    String jwt = await secureStorage.read(key: 'jwt') as String;

    try {
      Logger().d("=================1번");
      Response response = await dio.post(
        "/order/payment",
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
