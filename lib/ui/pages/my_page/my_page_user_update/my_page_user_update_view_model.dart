
// 모델
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/_core/constants/move.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/dto/user_request_dto.dart';
import 'package:team_project/data/repository/user_repository.dart';
import 'package:team_project/data/store/session_user.dart';
import 'package:team_project/main.dart';

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
  UserUpdateViewModel(super._state, this.ref);
  final mContext = navigatorKey.currentContext;
  Ref ref;


  Future<void> notifyInit() async {
     String jwt = await secureStorage.read(key: 'jwt') as String;

    Logger().d("토큰 있나?? $jwt ");

    // TODO 언약 : 세션에서 토큰 꺼내서 info 넘기기
    ResponseDTO responseDTO =
    await UserRepository().fetchUserInfo(jwt);
    Logger().d("값 받니? ${responseDTO.response}");
    UserUpdateModel model = responseDTO.response;
    state = UserUpdateModel(
        userId: model.userId,
        userImage: model.userImage,
        nickname: model.nickname);
  }

  // Future<void> userUpdate(UserUpdateReqDTO userUpdateReqDTO) async {
  //   Logger().d("세션 스토어 접근 : " + userUpdateReqDTO.nickname);
  //   Logger().d("세션 스토어 접근 : " + userUpdateReqDTO.userImage);
  //
  //   //   String jwt = await secureStorage.read(key: 'jwt') as String;
  //   // TODO 언약 : jwt 토큰 넘기기 통신할 때
  //   ResponseDTO responseDTO =
  //   await UserRepository().fetchUserUpdate(userUpdateReqDTO);
  //
  //   if (responseDTO.success == true) {
  //     Navigator.pop(mContext!);
  //   } else {
  //     ScaffoldMessenger.of(mContext!)
  //         .showSnackBar(SnackBar(content: Text(responseDTO.error)));
  //   }
  // }

}

// 창고 관리자
final userUpdateProvider = StateNotifierProvider.autoDispose<
    UserUpdateViewModel, UserUpdateModel?>((ref) {
  return UserUpdateViewModel(null, ref)..notifyInit();
});


