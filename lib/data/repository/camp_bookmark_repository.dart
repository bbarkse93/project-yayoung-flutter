
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/model/camp_bookmark_state.dart';
import 'package:team_project/ui/pages/my_page/my_page_like_page/my_page_like_page_widgets/my_page_like_page_view_model.dart';

import '../dto/camp_request_dto.dart';

class CampBookmarkRepository {

  Future<ResponseDTO> fetchLikeInfo() async {
    String jwt = await secureStorage.read(key: 'jwt') as String;

    try {
      Response response = await dio.get("/camp/bookmark-list",
          options: Options(headers: {"Authorization": jwt}));


      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d(responseDTO.response);
      LikePageModel likePageModel = LikePageModel.fromJson(responseDTO.response);
      responseDTO.response = likePageModel;

      return responseDTO;

    } catch (e) {
      return ResponseDTO(false, e.toString(), null);
    }
  }

  Future<ResponseDTO> fetchSaveBookmark(CampSaveOrDeleteDTO requestDTO) async {

    String jwt = await secureStorage.read(key: 'jwt') as String;

    try{
      // 통신
      Response response = await dio.post("/camp/bookmark", options: Options(headers: {'Authorization': jwt}), data: requestDTO.toJson());
      // 응답 받은 데이터 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      responseDTO.response = CampBookmarkState.fromJson(responseDTO.response);

      return responseDTO;

    }catch(e){
      return ResponseDTO(false, "북마크 등록 실패", null);
    }
  }

  Future<ResponseDTO> fetchDeleteBookmark(CampSaveOrDeleteDTO requestDTO) async {
    String jwt = await secureStorage.read(key: 'jwt') as String;

    try{
      // 통신
      Response response = await dio.delete("/camp/bookmark", options: Options(headers: {'Authorization': jwt}), data: requestDTO.toJson());
      // 응답 받은 데이터 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      responseDTO.response = CampBookmarkState.fromJson(responseDTO.response);

      return responseDTO;

    }catch(e){
      return ResponseDTO(false, "북마크 삭제 실패", null);
    }
  }

}