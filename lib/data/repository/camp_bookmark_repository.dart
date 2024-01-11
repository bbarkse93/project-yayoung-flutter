
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/ui/pages/my_page/like_page/like_page_widgets/like_page_view_model.dart';

class CampBookmarkRepository {

  Future<ResponseDTO> fetchLikeInfo() async {
    try {
      Response response = await dio.get("/camp/bookmark-list");

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d(responseDTO.response);
      LikePageModel likePageModel = LikePageModel.fromJson(responseDTO.response);
      responseDTO.response = likePageModel;

      return responseDTO;

    } catch (e) {
      return new ResponseDTO(false, e.toString(), null);
    }
  }


}