import 'package:logger/logger.dart';
import 'package:riverpod/riverpod.dart';
import 'package:team_project/data/dto/camp_request_dto.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/model/camp.dart';
import 'package:team_project/data/repository/campsite_list_repository.dart';
import 'package:team_project/main.dart';

class CampListModel {
  List<Camp> campList;
  CampListModel(this.campList);
}

// campDTO
class CampDTO {
  int id;
  String campName;
  String campAddress;
  String campImage;
  String campRating;

  CampDTO(this.id, this.campName, this.campAddress, this.campImage,
      this.campRating);

  CampDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        campName = json["campName"],
        campAddress = json["campAddress"],
        campImage = json["campImage"],
        campRating = json["campRating"];
}

// 2. 창고
class CampListViewModel extends StateNotifier<CampListModel?> {
  CampListViewModel(super._state, this.ref);
  final mContext = navigatorKey.currentContext;
  Ref ref;

  Future<void> notifyInit() async {
    Logger().d("뷰모델 진입");
    ResponseDTO responseDTO = await CampListRepository().fetchCampList();
    Logger().d("모델에 값 담기 전 :${responseDTO.response}");
    state = CampListModel(responseDTO.response);
  }

  Future<void> campListFilter(CampListDTO campListDTO) async {
    Logger().d("뷰모델 진입 ${campListDTO.optionNames}");
    ResponseDTO responseDTO =
        await CampListRepository().fetchCampListFilter(campListDTO);
    state = CampListModel(responseDTO.response);
  }
}

// 3. 창고 관리자
final campListProvider =
    StateNotifierProvider.autoDispose<CampListViewModel, CampListModel?>((ref) {
  Logger().d("프로바이더 진입");
  return CampListViewModel(null, ref)..notifyInit();
});
