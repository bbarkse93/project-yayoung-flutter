//창고 데이터
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/model/camp.dart';
import 'package:team_project/data/repository/campsite_detail_repository.dart';
import 'package:team_project/data/store/param_store.dart';
import 'package:team_project/main.dart';

class CampDetailModel {
  Camp camp;

  CampDetailModel(this.camp);
}

//창고
class CampDetailViewModel extends StateNotifier<CampDetailModel?> {
  CampDetailViewModel(super._state, this.ref);

  final mContext = navigatorKey.currentContext;
  Ref ref;

  Future<void> notifyInit(int id) async {
    ResponseDTO responseDTO = await CampDetailRepository().fetchCampDetail(id);

    state = CampDetailModel(responseDTO.response);
  }
}

//창고 관리자
final campsiteDetailProvider =
StateNotifierProvider.autoDispose<CampDetailViewModel, CampDetailModel?>(
        (ref) {
          int id = ref.read(paramProvider).campDetailId!;
          return CampDetailViewModel(null, ref)..notifyInit(id);});