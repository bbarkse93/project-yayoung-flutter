import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/model/my_camping.dart';
import 'package:team_project/data/repository/my_camping_list_repository.dart';

void main() async {
  await notifyInit();
}

Future<void> notifyInit() async {
  Logger().d("화면 초기화");
  ResponseDTO responseDTO = await fetchMyCampingList();
  Logger().d(responseDTO); // 이 부분에서 Future 객체가 아니라 실제 결과를 기다림
  print("노티파이 이닛 탈출");
}

Future<ResponseDTO> fetchMyCampingList() async {
  try {
    print("통신 시작");
    // 통신
    final response = await dio.get("http://localhost:8080/camp/myCamp");
    Logger().d("response는 ?? $response");
    print("연결되었나요?");

    // ResponseDTO파싱
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    Logger().d(response.data);
    print("파싱되었나요?");

    // ResponseDTO의 data 파싱
    List<dynamic> mapList = responseDTO.response['myCampDTOs'] as List<dynamic>;
    List<MyCamping> campList = mapList.map((e) => MyCamping.fromJson(e)).toList();
    print("데이터는?");

    // 파싱된 데이터를 공통DTO로 덮어씌우기
    responseDTO.response = campList;
    print("데이터 전송");
    return responseDTO;
  } catch (e) {
    print("이 자리는 실패");
    return ResponseDTO(false, "캠핑장목록 불러오기 실패", null);
  }
}
