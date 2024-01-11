import 'package:logger/logger.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/model/camp.dart';
import 'package:team_project/data/repository/campsite_list_repository.dart';
import 'package:riverpod/riverpod.dart';
import 'package:team_project/main.dart';

class CampListModel {
  List<Camp> campList;

  CampListModel(this.campList);
}

// 2. 창고
class CampListViewModel extends StateNotifier<CampListModel?> {
  CampListViewModel(super._state, this.ref);
  final mContext = navigatorKey.currentContext;
  Ref ref;

  Future<void> notifyInit() async {
    ResponseDTO responseDTO = await CampListRepository().fetchCampList();

    state = CampListModel(responseDTO.response);
  }

}

// 3. 창고 관리자
final campListProvider = StateNotifierProvider.autoDispose<CampListViewModel, CampListModel?>(
        (ref) {return CampListViewModel(null, ref)..notifyInit();
    });