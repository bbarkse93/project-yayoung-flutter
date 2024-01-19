import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:riverpod/riverpod.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/_core/constants/move.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/dto/review_request_dto.dart';
import 'package:team_project/data/model/camp_review_list.dart';
import 'package:team_project/data/repository/review_repository.dart';
import 'package:team_project/main.dart';
import 'package:team_project/ui/pages/review/review_page.dart';

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
    Logger().d("${responseDTO.response}");

    state = ReviewListModel(responseDTO.response);
    Logger().d(state!.campReviewList.toString());
  }

Future<void> fetchSave(ReviewWriteDTO reviewWriteDTO, int campId) async {

  ResponseDTO responseDTO =
  await ReviewRepository().fetchReviewSave(reviewWriteDTO, campId);

  if (responseDTO.success == true) {
    state = ReviewListModel(responseDTO.response);
    // Navigator.pop(mContext!);
  } else {
    ScaffoldMessenger.of(mContext!)
        .showSnackBar(SnackBar(content: Text(responseDTO.error)));
  }
}

}

// 3. 창고 관리자
final reviewListProvider =
    StateNotifierProvider.family.autoDispose<ReviewListViewModel, ReviewListModel?, int>((ref, campId) {
  return ReviewListViewModel(null, ref)..notifyInit(campId);
});
