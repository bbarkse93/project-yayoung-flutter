//창고 데이터
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/model/camp.dart';
import 'package:team_project/data/model/camp_bookmark_state.dart';
import 'package:team_project/data/model/campsite_detail.dart';
import 'package:team_project/data/repository/camp_bookmark_repository.dart';
import 'package:team_project/data/repository/campsite_detail_repository.dart';
import 'package:team_project/data/store/param_store.dart';
import 'package:team_project/main.dart';

import '../../../../data/dto/camp_request_dto.dart';

class CampDetailModel {
  late CampsiteDetail campInfo;
  CampDetailModel(this.campInfo);

  // 깊은 복사
  CampDetailModel.copy(CampDetailModel model) {
    if (model != null) {
      campInfo = model.campInfo;
    }
  }
}

class CampBookMark {
  CampBookmarkState campBookmarkState;
  CampBookMark(this.campBookmarkState);
}

//창고
class CampDetailViewModel extends StateNotifier<CampDetailModel?> {
  CampDetailViewModel(super._state, this.ref);

  final mContext = navigatorKey.currentContext;
  Ref ref;

  String jwt =
      "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwcm9qZWN0LWtleSIsImlkIjoxLCJ1c2VybmFtZSI6bnVsbCwiZXhwIjo0ODU5MDUzNDgyfQ.Ky2-BLYTjxlouBRsY1HScpc3fC3FOhpK0OrCKy3MFFW6KkCC19B2KsZrd9NIYLoeYY1YEB2BQNLT_KjPETTPMw";

  Future<void> notifyInit(int campId) async {

    // String jwt = secureStorage.read(key: 'jwt').toString();
    ResponseDTO responseDTO =
        await CampDetailRepository().fetchCampDetail(campId, jwt);

    state = CampDetailModel(responseDTO.response);
  }

  Future<void> saveBookmark(CampSaveOrDeleteDTO requestDTO) async {

    // String jwt = secureStorage.read(key: 'jwt').toString();
    ResponseDTO responseDTO =
        await CampBookmarkRepository().fetchSaveBookmark(requestDTO, jwt);
    CampDetailModel? model = state;
    model!.campInfo.bookmark = CampBookMark(responseDTO.response).campBookmarkState.bookmark;
    // 깊은 복사
    state = CampDetailModel.copy(model);

  }

  Future<void> deleteBookmark(CampSaveOrDeleteDTO requestDTO) async {

    // String jwt = secureStorage.read(key: 'jwt').toString();
    ResponseDTO responseDTO =
    await CampBookmarkRepository().fetchDeleteBookmark(requestDTO, jwt);
    CampDetailModel? model = state;
    model!.campInfo.bookmark = CampBookMark(responseDTO.response).campBookmarkState.bookmark;
    // 깊은 복사
    state = CampDetailModel.copy(model);
  }
}

//창고 관리자
final campsiteDetailProvider =
    StateNotifierProvider.family<CampDetailViewModel, CampDetailModel?, int>(
        (ref, campId) {
  return CampDetailViewModel(null, ref)..notifyInit(campId);
});
