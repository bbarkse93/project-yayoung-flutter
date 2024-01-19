
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
  // context 접근
  final mContext = navigatorKey.currentContext;

  User? user;
  String? jwt;
  bool isLogin; // jwt의 존재보다 유효에 따른 true/false

  SessionUser({this.user, this.jwt, this.isLogin = false});

  String token =
      "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJwcm9qZWN0LWtleSIsImlkIjoxLCJ1c2VybmFtZSI6bnVsbCwiZXhwIjo0ODU5MDUzNDgyfQ.Ky2-BLYTjxlouBRsY1HScpc3fC3FOhpK0OrCKy3MFFW6KkCC19B2KsZrd9NIYLoeYY1YEB2BQNLT_KjPETTPMw";

  Future<void> login(LoginReqDTO loginReqDTO, String token) async {

    // 통신 코드
    ResponseDTO responseDTO = await UserRepository().fetchLogin(loginReqDTO,token);

    Logger().d("로그인 통신 후 ${responseDTO.response}");
    Logger().d("로그인 통신 후 ${responseDTO.token}");

    // 비즈니스 로직
    if (responseDTO.success == true) {
      // 세션 값 갱신 : 로그인이 성공하면, 창고 데이터 갱신
      this.user = responseDTO.response; // TODO : as 생략 = 컨벤션
      this.jwt = responseDTO.token;
      this.isLogin = true;



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

  Future<void> userUpdate(UserUpdateReqDTO userUpdateReqDTO) async {
    String jwt = await secureStorage.read(key: 'jwt') as String;
    ResponseDTO responseDTO =
    await UserRepository().fetchUserUpdate(userUpdateReqDTO, jwt);

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

/// 창고 관리자
final sessionStore = Provider<SessionUser>((ref) {
  return SessionUser();
});