//창고 데이터
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/model/camp.dart';
import 'package:team_project/data/model/campsite_detail.dart';
import 'package:team_project/data/repository/campsite_detail_repository.dart';
import 'package:team_project/data/store/param_store.dart';
import 'package:team_project/main.dart';

class CampDetailModel {
  CampsiteDetail campInfo;

  CampDetailModel(this.campInfo);
}

//창고
class CampDetailViewModel extends StateNotifier<CampDetailModel?> {
  CampDetailViewModel(super._state, this.ref);

  final mContext = navigatorKey.currentContext;
  Ref ref;

  Future<void> notifyInit(int campId) async {
    ResponseDTO responseDTO = await CampDetailRepository().fetchCampDetail(campId);

    state = CampDetailModel(responseDTO.response);

  }

}

//창고 관리자
final campsiteDetailProvider =
StateNotifierProvider.family.autoDispose<CampDetailViewModel, CampDetailModel?, int>(
        (ref, campId) {
          return CampDetailViewModel(null, ref)..notifyInit(campId);});