import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/model/camp.dart';
import 'package:team_project/data/repository/campsite_list_repository.dart';
import 'package:team_project/ui/pages/campsite/campsite_list/campsite_list_view_model.dart';

void main() async {

  await fetchCampList();
}

// Future<void> notifyInit() async {
//   Logger().d("화면 초기화");
//   ResponseDTO responseDTO = await CampListRepository().fetchCampList();
//   // Logger().d("responseDTO :  $responseDTO");
//   // Logger().d("responseDTO :  ${responseDTO.response.toString()}");
//
// }

// 페이지 북마크 등록 및 삭제
Future<ResponseDTO> fetchCampList() async {
  try {
    print("통신 시작");
    // 통신
    final response = await dio.get("/camp/list");
    // Logger().d("response : $response");
    // ResponseDTO파싱
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    // Logger().d("1차파싱 후 1: ${responseDTO.response}");
    // Logger().d("1차파싱 후 2: ${responseDTO.response["campDTO"]}");
    Logger().d("나여기까지 1");
    // List<Camp> campDTOList =
    // Logger().d("1차파싱 후 3: ${campDTOList}");
    // List<dynamic> mapList = responseDTO.response as List<dynamic>;
    // List<Camp> campList = mapList.map((e) => Camp.fromJson(e)).toList();
    List<dynamic> mapList = responseDTO.response["campDTO"];
    responseDTO.response = mapList.map((e) => CampDTO.fromJson(e)).toList();
    // 파싱된 데이터를 공통DTO로 덮어씌우기
    // responseDTO.response = campList;
    Logger().d("파싱완료");
    Logger().d(responseDTO.response.toString());

    return responseDTO;
  } catch (e) {
    return ResponseDTO(false, "캠핑장목록 불러오기 실패", null);
  }
}
