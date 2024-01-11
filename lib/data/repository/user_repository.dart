import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/dto/user_request_dto.dart';
import 'package:team_project/ui/pages/my_page/user_update/user_update_view_model.dart';


class UserRepository {
  // 업데이트 요청
  // TODO : 언약 -> 매겨변수 추가하기 (String jwt,)
  Future<ResponseDTO> fetchUserUpdate(
       UserUpdateReqDTO userUpdateReqDTO) async {
    print("레파지토리 접근 : " + userUpdateReqDTO.userImage);
    print("레파지토리 접근 : " + userUpdateReqDTO.nickname);

    try {
      final response = await dio.put("/user/my-page/profile",
          data: userUpdateReqDTO.toJson());
      Logger().d("업데이트DTO임 : $userUpdateReqDTO");
         // options: Options(headers: {"Authorization": "$jwt"}));

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      return responseDTO;
    } catch (e) {
      return new ResponseDTO(false, e.toString(), null);
    }
  }

  // 화면 요청
  // TODO 언약 : 토큰 매개변수 받기
  Future<ResponseDTO> fetchUserInfo() async {
    try {
      Response response = await dio.get("/user/my-page/profile");

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      // Logger().d(responseDTO.response);
      UserUpdateModel model =
      UserUpdateModel.fromJson(responseDTO.response);
      responseDTO.response = model;

      return responseDTO;

    } catch (e) {
      return new ResponseDTO(false, e.toString(), null);
    }
  }


}

