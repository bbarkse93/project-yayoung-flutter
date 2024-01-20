import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/model/my_camping.dart';
import 'package:team_project/ui/pages/my_camping_list/my_camping_list_view_model.dart';

class MyCampingListRepository {
  Future<ResponseDTO> fetchMyCampingList() async {

    // String jwt = await secureStorage.read(key: 'jwt') as String;

    String jwt =
        "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwcm9qZWN0LWtleSIsImlkIjozLCJ1c2VybmFtZSI6ImpiekhybE9yQ2pSUm5DWGtjZ2trSFdXWXFpWnQzWFFKZHpYVDNxbDhPbTgiLCJleHAiOjQ4NTkxMzgxNjB9.j8pUOQ8WTots0gXL1Ei_ZHWlyqlpf9mdXyvcJ6UNjkfxDyksayuJLcV7zLmO3VS7QMAUop7fWMgstth6ao6_Iw";
    try {
      final response = await dio.get("/camp/myCamp"
        ,options: Options(headers: {"Authorization": jwt}));
      Logger().d("response는 ?? $response");

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      if (responseDTO.success) {
        dynamic responseData = responseDTO.response;

        if (responseData is Map<String, dynamic> &&
            responseData.containsKey('myCampDTOs')) {
          List<dynamic> myCampDTOs =
          responseData['myCampDTOs'] as List<dynamic>;
          List<MyCamping> campList =
          myCampDTOs.map((e) => MyCamping.fromJson(e)).toList();
          responseDTO.response = MyCampingListModel(campList);
        } else {
          Logger().e(
              "통신 에러: 'myCampDTOs' 키를 찾을 수 없거나 유효하지 않은 데이터 구조입니다.");
          responseDTO = ResponseDTO(false, "유효하지 않은 데이터 구조", null);
        }
      }
      return responseDTO;
    } catch (e) {
      Logger().e("통신 에러: $e");
      return ResponseDTO(false, "캠핑장 목록 불러오기 실패: $e", null);
    }
  }
}