import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/dto/user_request_dto.dart';
import 'package:team_project/data/model/user.dart';
import 'package:team_project/ui/pages/my_page/my_page_user_update/my_page_user_update_view_model.dart';

class UserRepository {
  // 로그인 요청
  Future<ResponseDTO> fetchLogin(LoginReqDTO requestDTO, String token) async {
    Logger().d("유저 레파지토리 통신 전 : ${requestDTO.socialName}");
    Logger().d("유저 레파지토리 통신 전 : $token");

    try {
      final response = await dio.post("/user/login",
          options: Options(headers: {"Authorization": token}),
          data: requestDTO.toJson());

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      User user = User.fromJson(responseDTO.response);

      // 파싱한 user 데이터 다시 responseDTO.data에 담기
      responseDTO.response = user;

      // 토큰 세션값 변경을 위해 response의 헤더의 jwt를 가져와서 등록하기
      final jwt = response.headers["Authorization"];
      if (jwt != null) {
        responseDTO.token = jwt.first; // = jwt[0]
      }

      Logger().d("유저 레파지토리 토큰 담김? ${responseDTO.token}");
      Logger().d("유저 레파지토리 유저정보 담김? $user");

      return responseDTO;
    } catch (e) {
      return ResponseDTO(false, "유저네임 혹은 비밀번호가 틀렸습니다.", null);
    }
  }

  // 업데이트 요청
  // TODO : 언약 -> 매겨변수 추가하기 (String jwt,)
  Future<ResponseDTO> fetchUserUpdate(UserUpdateReqDTO userUpdateReqDTO) async {
    String jwt = await secureStorage.read(key: 'jwt') as String;

    Logger().d("유저 통신 전 : ${userUpdateReqDTO.userImage}");
    Logger().d("유저 통신 전 : ${userUpdateReqDTO.nickname}");
    try {
      final response = await dio.put("/user/my-page/profile",
          options: Options(headers: {"Authorization": jwt}),
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
    String jwt = await secureStorage.read(key: 'jwt') as String;

    try {
      Response response = await dio.get("/user/my-page/profile",
          options: Options(headers: {"Authorization": jwt}));

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      // Logger().d(responseDTO.response);
      UserUpdateModel model = UserUpdateModel.fromJson(responseDTO.response);
      responseDTO.response = model;

      return responseDTO;
    } catch (e) {
      return new ResponseDTO(false, e.toString(), null);
    }
  }
}
