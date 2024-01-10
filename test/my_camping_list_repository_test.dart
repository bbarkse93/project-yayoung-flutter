import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/model/my_camping.dart';
import 'package:team_project/data/repository/my_camping_list_repository.dart';
import 'package:team_project/ui/pages/my_camping_list/my_camping_list_view_model.dart';

void main() async{
  await notifyInit();
}

Future<void> notifyInit() async {
  Logger().d("화면 초기화");
  ResponseDTO responseDTO = await MyCampingListRepository().fetchMyCampingList();
  Logger().d("responseDTO :  $responseDTO");


}

Future<ResponseDTO> fetchMyCampingList() async {
  try {

    print("통신 시작");
    // 통신
    final response = await dio.get("/camp/myCamp");
    Logger().d("response는 ?? $response");
    // ResponseDTO파싱
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    // ResponseDTO의 data 파싱
    List<dynamic> mapList = responseDTO.response as List<dynamic>;
    List<MyCamping> campList =
    mapList.map((e) => MyCamping.fromJson(e)).toList();

    // 파싱된 데이터를 공통DTO로 덮어씌우기
    responseDTO.response = campList;

    return responseDTO;
  } catch (e) {
    return ResponseDTO(false, "캠핑장목록 불러오기 실패", null);
  }
}


