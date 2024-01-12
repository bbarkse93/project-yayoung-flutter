
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/ui/pages/my_page/notice_page/notice_page_widgets/view_model/faq_view_model.dart';

void main () async {
  await fetchFaqInfo();
}


  Future<ResponseDTO> fetchFaqInfo() async {
    try {
      Response response = await dio.get("/board/list");
      Logger().d("통신 성공 : $response");
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d("파싱 1 : ${responseDTO.response}");
      FaqModel model = FaqModel.fromJson(responseDTO.response);
      Logger().d("파싱 2 : ${model.userDTOList}, ${model.paymentDTOList}");
      responseDTO.response = model;

      return responseDTO;

    } catch (e) {
      return new ResponseDTO(false, e.toString(), null);
    }
}
