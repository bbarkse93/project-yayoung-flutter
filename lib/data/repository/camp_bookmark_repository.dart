
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/ui/pages/my_page/my_page_like_page/my_page_like_page_widgets/my_page_like_page_view_model.dart';

class CampBookmarkRepository {

  Future<ResponseDTO> fetchLikeInfo(String token) async {
    try {
      Response response = await dio.get("/camp/bookmark-list",
          options: Options(headers: {"Authorization": token}));

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