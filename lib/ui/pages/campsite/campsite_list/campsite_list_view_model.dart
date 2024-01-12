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
    ResponseDTO responseDTO = await CampListRepository().fetchCampList();
    state = CampListModel(responseDTO.response);
  }

}

// 3. 창고 관리자
final campListProvider = StateNotifierProvider.autoDispose<CampListViewModel, CampListModel?>(
        (ref) {return CampListViewModel(CampListModel([]), ref)..notifyInit();
    });