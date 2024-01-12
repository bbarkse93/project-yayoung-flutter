

import 'package:dio/dio.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/ui/pages/my_page/notice_page/notice_page_widgets/view_model/notice_view_model.dart';

class NoticeRepository{
  Future<ResponseDTO> fetchNoticeInfo() async {
    try {
      Response response = await dio.get("/notice/list");

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      // Logger().d(responseDTO.response);
      NoticeModel model =
      NoticeModel.fromJson(responseDTO.response);
      responseDTO.response = model;

      return responseDTO;

    } catch (e) {
      return new ResponseDTO(false, e.toString(), null);
    }
  }

}

