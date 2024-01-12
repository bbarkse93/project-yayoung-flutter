
// 모델
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/repository/user_repository.dart';
import 'package:team_project/data/store/session_user.dart';

class UserUpdateModel {
  final int userId;
  final String userImage;
  final String nickname;

  UserUpdateModel(
      {
        required this.userId,
        required this.userImage,
        required this.nickname});

  UserUpdateModel.fromJson(Map<String, dynamic> json)
      : userId = json["userId"],
        userImage = json["userImage"],
        nickname = json["nickname"];
}

// 창고
class UserUpdateViewModel extends StateNotifier<UserUpdateModel?> {
  Ref ref;
  UserUpdateViewModel(super._state, this.ref);

  Future<void> notifyInit() async {
    SessionUser sessionUser = ref.read(sessionStore);
    //TODO 언약 : 세션에서 토큰 꺼내서 info 넘기기
    ResponseDTO responseDTO =
    await UserRepository().fetchUserInfo();
    Logger().d("값 받니? ${responseDTO.response}");
    UserUpdateModel model = responseDTO.response;
    state = UserUpdateModel(
        userId: model.userId,
        userImage: model.userImage,
        nickname: model.nickname);
  }
}

// 창고 관리자
final userUpdateProvider = StateNotifierProvider.autoDispose<
    UserUpdateViewModel, UserUpdateModel?>((ref) {
  return UserUpdateViewModel(null, ref)..notifyInit();
});


