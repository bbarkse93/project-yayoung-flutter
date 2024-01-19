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
  MyCampingListViewModel(this.ref) : super(MyCampingListModel([]));

  final mContext = navigatorKey.currentContext;
  Ref ref;

  Future<void> notifyInit() async {


    Logger().d("화면 초기화");
    ResponseDTO responseDTO = await MyCampingListRepository().fetchMyCampingList();

    Logger().d("response는 ?? $responseDTO");

    if (responseDTO.success) {
      dynamic responseData = responseDTO.response;

      if (responseData is MyCampingListModel) {
        // 이미 MyCampingListModel로 왔을 경우에는 그대로 사용
        state = responseData;
      } else if (responseData is List<MyCamping>) {
        // List<MyCamping>으로 왔을 경우 MyCampingListModel으로 변환
        state = MyCampingListModel(responseData);
        Logger().d("state : $state");
      } else {
        Logger().e("통신 에러: 유효하지 않은 데이터 구조입니다.");
      }
    } else {
      Logger().e("통신 에러: ${responseDTO.error}");
    }
  }
}

// 3. 창고관리자
final myCampingListProvider = StateNotifierProvider.autoDispose<
    MyCampingListViewModel, MyCampingListModel?>((ref) {
  return MyCampingListViewModel(ref)..notifyInit();
});
