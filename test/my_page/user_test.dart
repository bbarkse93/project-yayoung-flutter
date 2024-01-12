
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/ui/pages/my_page/my_page_user_update/my_page_user_update_view_model.dart';

void main () async {
  await fetchUserInfo();
}

Future<ResponseDTO> fetchUserInfo() async {
  try {
    Response response = await dio.get("/user/my-page/profile");
     Logger().d("1 = $response");

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    // Logger().d("2 = ${responseDTO.response}");
    UserUpdateModel model =
    UserUpdateModel.fromJson(responseDTO.response);
    responseDTO.response = model;
    Logger().d("3 = ${responseDTO.response}");

    return responseDTO;

  } catch (e) {
    return new ResponseDTO(false, e.toString(), null);
  }
}
