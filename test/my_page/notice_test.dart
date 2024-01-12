
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/ui/pages/my_page/my_page_notice_page/notice_page_widgets/my_page_notice_view_model/my_page_notice_view_model.dart';


void main () async {
  await fetchNoticeInfo();
}

Future<ResponseDTO> fetchNoticeInfo() async {
  try {
    Response response = await dio.get("/notice/list");
    Logger().d("통신 성공 : $response");
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    Logger().d("파싱 1 : ${responseDTO.response}");
    NoticeModel model = NoticeModel.fromJson(responseDTO.response);
    Logger().d("파싱 2 : ${model.noticeDTOList}");
    responseDTO.response = model;

    return responseDTO;

  } catch (e) {
    return new ResponseDTO(false, e.toString(), null);
  }
}
