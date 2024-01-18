import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/dto/user_request_dto.dart';
import 'package:team_project/data/model/camp_review.dart';
import 'package:team_project/data/model/camp_review_list.dart';

class ReviewRepository {
  Future<ResponseDTO> fetchReviewList(campId) async {

    try {

      final response = await dio.get("/camp/review/${campId}");
      // options: Options(headers: {"Authorization": "${jwt}"}));

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      responseDTO.response = CampReviewList.fromJson(responseDTO.response);

      return responseDTO;
    } catch (e) {
      return ResponseDTO(false, "통신실패", null);
    }
  }

  fetchAddReview() {}
}
