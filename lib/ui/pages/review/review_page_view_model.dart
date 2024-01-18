import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:riverpod/riverpod.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/dto/review_request_dto.dart';
import 'package:team_project/data/model/camp_review_list.dart';
import 'package:team_project/data/repository/review_repository.dart';
import 'package:team_project/main.dart';

class ReviewListModel {
  CampReviewList? campReviewList;

  ReviewListModel(this.campReviewList);
}

// 2. 창고
class ReviewListViewModel extends StateNotifier<ReviewListModel?> {
  ReviewListViewModel(super._state, this.ref);

  final mContext = navigatorKey.currentContext;
  Ref ref;

  Future<void> notifyInit(campId) async {
    ResponseDTO responseDTO = await ReviewRepository().fetchReviewList(campId);
    state = ReviewListModel(responseDTO.response);
    Logger().d(state!.campReviewList.toString());
  }

  Future<ResponseDTO> fetchSave(ReviewWriteDTO reviewWriteDTO, int campId) async {
    try {

      Response<dynamic> response = await dio.post("/review/$campId",
          // options: Options(headers: {"Authorization": "${jwt}"}),
          data: reviewWriteDTO.toJson());

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d("responseDTO : ${responseDTO}");

      return responseDTO;
    } catch (e) {
      return ResponseDTO(false, "리뷰를 등록할 수 없습니다.", null);
    }
  }

}

// 3. 창고 관리자
final reviewListProvider =
    StateNotifierProvider.family.autoDispose<ReviewListViewModel, ReviewListModel?, int>((ref, campId) {
  return ReviewListViewModel(null, ref)..notifyInit(campId);
});
