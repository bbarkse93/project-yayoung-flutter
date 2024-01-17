import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/dto/user_request_dto.dart';

class PaymentRepository {
  Future<ResponseDTO> fetchPayment(PaymentReqDTO dto) async {
    try {
      Response response = await dio.post(
        "/order/payment",
        data: dto.toJson(),
      );
      // options: Options(headers: {"Authorization": "${jwt}"}));

      ResponseDTO responseDTO = new ResponseDTO.fromJson(response.data);
      return responseDTO;
    } catch (e) {
      Logger().d("dio 통신 되? ${e.toString()}");
      return new ResponseDTO(false, "통신실패", null);
    }
  }
}
