
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/model/my_camping.dart';
import 'package:team_project/data/repository/my_camping_list_repository.dart';
import 'package:team_project/main.dart';

class MyCampingListModel {
  List<MyCamping> campingList;

  MyCampingListModel(this.campingList);
}

// 2. 창고
class MyCampingListViewModel extends StateNotifier<MyCampingListModel?> {
  MyCampingListViewModel(super._state, this.ref);
  final mContext = navigatorKey.currentContext;
  Ref ref;

  Future<void> notifyInit() async {
    Logger().d("화면 초기화");
    ResponseDTO responseDTO = await MyCampingListRepository().fetchMyCampingList();
    Logger().d("responseDTO :  $responseDTO");
    state = MyCampingListModel(responseDTO.response);
    Logger().d("state :  $state");
  }

}

// 3. 창고 관리자
final myCampingListProvider = StateNotifierProvider.autoDispose<MyCampingListViewModel, MyCampingListModel?>(
        (ref) {return MyCampingListViewModel(MyCampingListModel([]), ref)..notifyInit();
    });