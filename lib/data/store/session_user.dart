
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/_core/constants/move.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/dto/user_request_dto.dart';
import 'package:team_project/data/model/user.dart';
import 'package:team_project/data/repository/user_repository.dart';
import 'package:team_project/main.dart';

class SessionUser {

  User? user;
  String? jwt;
  bool isLogin; // jwt의 존재보다 유효에 따른 true/false

  SessionUser({this.user, this.jwt, this.isLogin = false});

}

  class SessionStore extends SessionUser {
    final mContext = navigatorKey.currentContext;


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

  // 카카오 로그인
  Future<void> login(LoginReqDTO loginReqDTO, String token) async {
    Logger().d("레파지토리 통신 전 : ${loginReqDTO.socialName}");
    Logger().d("레파지토리 통신 전 : $token");

    // 통신 코드
    ResponseDTO responseDTO = await UserRepository().fetchLogin(loginReqDTO, token);
    Logger().d("레파지토리 통신 후 : ${responseDTO.toString()}");
    Logger().d("레파지토리 통신 후 : ${responseDTO.response}");

    // 비즈니스 로직
    if (responseDTO.success == true) {
      // 세션 값 갱신 : 로그인이 성공하면, 창고 데이터 갱신
      SessionUser user = SessionUser(user: responseDTO.response, jwt: responseDTO.token, isLogin: true);
      this.user = responseDTO.response; // TODO : as 생략 = 컨벤션
      this.jwt = responseDTO.token;
      this.isLogin = true;

      Logger().d("세션 유저 데이터 잘 갔지? : ${user.user}");
      Logger().d("세션 유저 데이터 잘 갔지? : ${user.jwt}");
      Logger().d("세션 유저 데이터 잘 갔지? : ${user.isLogin}");

      // 디바이스에 JWT 저장 : 자동로그인
      await secureStorage.write(key: "jwt", value: responseDTO.token);

      // 메인으로 화면 이동
      // TODO 은혜 : 메인 페이지 완성 시 이동
      Navigator.pushNamed(mContext!, Move.mainScreenPage);


    } else {
      ScaffoldMessenger.of(mContext!)
          .showSnackBar(SnackBar(content: Text(responseDTO.error)));
    }
  }

  Future<void> logout() async {
    // this.user = null;
    // this.jwt = null;
    // this.isLogin = false;
    await secureStorage.delete(key: "jwt");
    Logger().d("세션 종료 및 디바이스 JWT 삭제");
  }

}

final sessionProvider = Provider<SessionStore>((ref) {
  print('세션스토어 접근 : ');
  return SessionStore();
});