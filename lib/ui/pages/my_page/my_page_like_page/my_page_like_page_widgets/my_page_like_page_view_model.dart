import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/repository/camp_bookmark_repository.dart';

class LikePageModel {
  late List<CampBookmarkDTO>? campBookmarkList; // List

  LikePageModel({
    this.campBookmarkList,
  });

  factory LikePageModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> temp = json["campBookmarkList"];
    List<CampBookmarkDTO> campBookmarkList =
        temp.map((e) => CampBookmarkDTO.fromJson(e)).toList();

    return LikePageModel(
      campBookmarkList: campBookmarkList, // Object
    );
  }
}

class CampBookmarkDTO {
  int? campId;
  String? campName;
  String? campAddress;
  String? campImage;
  String? campRating;

  CampBookmarkDTO({
    this.campId,
    this.campName,
    this.campAddress,
    this.campImage,
    this.campRating,
  });

  factory CampBookmarkDTO.fromJson(Map<String, dynamic> json) =>
      CampBookmarkDTO(
        campId: json["campId"],
        campName: json["campName"],
        campAddress: json["campAddress"],
        campImage: json["campImage"],
        campRating: json["campRating"],
      );
}

// 창고
class LikePageViewModel extends StateNotifier<LikePageModel?> {
  Ref ref;
  LikePageViewModel(super._state, this.ref);

  Future<void> notifyInit() async {
    String jwt = await secureStorage.read(key: 'jwt') as String;

    //TODO 언약 : 세션에서 토큰 꺼내서 info 넘기기
    ResponseDTO responseDTO = await CampBookmarkRepository().fetchLikeInfo();
    Logger().d("값 받니? ${responseDTO.response}");
    LikePageModel model = responseDTO.response;
    state = LikePageModel(campBookmarkList: model.campBookmarkList);
    Logger().d("상태 : ${state?.campBookmarkList}");
  }
}

// 창고 관리자
final likePageProvider =
    StateNotifierProvider.autoDispose<LikePageViewModel, LikePageModel?>((ref) {
  return LikePageViewModel(null, ref)..notifyInit();
});
