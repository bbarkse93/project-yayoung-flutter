import 'package:logger/logger.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/model/camp.dart';
import 'package:team_project/data/repository/campsite_list_repository.dart';
import 'package:riverpod/riverpod.dart';
import 'package:team_project/main.dart';

class CampListModel {
  List<Camp> campList;
  int? selectedCampId;
  CampListModel(this.campList, {this.selectedCampId});
}

// 2. 창고
class CampListViewModel extends StateNotifier<CampListModel?> {
  CampListViewModel(super._state, this.ref);
  final mContext = navigatorKey.currentContext;
  Ref ref;

  Future<void> notifyInit() async {
    Logger().d("화면 초기화");
    ResponseDTO responseDTO = await CampListRepository().fetchCampList();
    Logger().d("responseDTO :  $responseDTO");
    state = CampListModel(responseDTO.response);
    Logger().d("state :  $state");
  }

  void setCampId(int id){
    state = CampListModel(state!.campList, selectedCampId: id);

  }

}

// 3. 창고 관리자
final campListProvider = StateNotifierProvider.autoDispose<CampListViewModel, CampListModel?>(
        (ref) {return CampListViewModel(null, ref)..notifyInit();
    });