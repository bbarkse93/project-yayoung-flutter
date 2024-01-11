
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/dto/user_request_dto.dart';
import 'package:team_project/data/model/user.dart';
import 'package:team_project/data/repository/user_repository.dart';
import 'package:team_project/main.dart';

class SessionUser {
  // context 접근
  final mContext = navigatorKey.currentContext;

  User? user;
  String? jwt;
  bool isLogin; // jwt의 존재보다 유효에 따른 true/false

  SessionUser({this.user, this.jwt, this.isLogin = false});

  Future<void> userUpdate(UserUpdateReqDTO userUpdateReqDTO) async {
    Logger().d("세션 스토어 접근 : " +  userUpdateReqDTO.nickname);
    Logger().d("세션 스토어 접근 : " +  userUpdateReqDTO.userImage);

  //   String jwt = await secureStorage.read(key: 'jwt') as String;
    // TODO 언약 : jwt 토큰 넘기기 통신할 때
    ResponseDTO responseDTO =
    await UserRepository().fetchUserUpdate(userUpdateReqDTO);



    if (responseDTO.success == true) {
      Navigator.pop(mContext!);
    } else {
      ScaffoldMessenger.of(mContext!)
          .showSnackBar(SnackBar(content: Text(responseDTO.error)));
    }
  }

  Future<void> logout() async {
    this.user = null;
    this.jwt = null;
    this.isLogin = false;
    await secureStorage.delete(key: "jwt");
    Logger().d("세션 종료 및 디바이스 JWT 삭제");
  }

}

final sessionStore = Provider<SessionUser>((ref) {
  print('세션스토어 접근 : ');
  return SessionUser();
});