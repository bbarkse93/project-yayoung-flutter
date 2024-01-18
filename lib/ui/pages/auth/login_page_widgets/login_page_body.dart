import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/data/dto/user_request_dto.dart';
import 'package:team_project/data/store/session_user.dart';

class LoginPageBody extends ConsumerWidget {
  const LoginPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(gapMain),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Image.asset("assets/images/yayoung_logo.png"),
          Spacer(),
          // 카카오 로그인 클릭 버튼
          InkWell(
            child: Container(
              decoration: BoxDecoration(
                  color: kKakaoLogin,
                  borderRadius: BorderRadius.circular(gapMedium)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: gapMedium, top: gapSmall, bottom: gapSmall),
                    child: SvgPicture.asset(
                      "assets/images/kakao_login.svg",
                      width: gapXLarge,
                      height: gapXLarge,
                    ),
                  ),
                  Spacer(),
                  const Text(
                    "카카오로 로그인",
                    style: TextStyle(
                        fontSize: fontLarge, fontWeight: FontWeight.bold),
                  ),
                  Spacer()
                ],
              ),
            ),
            onTap: () {
             _signInKakao(context);
            },
          ),
          SizedBox(
            height: gapXSmall,
          ),
          // 네이버 로그인 클릭 버튼
          InkWell(
            child: Container(
              decoration: BoxDecoration(
                  color: kKakaoLogin,
                  borderRadius: BorderRadius.circular(gapMedium)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: gapMedium, top: gapSmall, bottom: gapSmall),
                    child: SvgPicture.asset(
                      "assets/images/naver_login.svg",
                      width: gapXLarge,
                      height: gapXLarge,
                    ),
                  ),
                  Spacer(),
                  const Text(
                    "네이버로 로그인",
                    style: TextStyle(
                        fontSize: fontLarge, fontWeight: FontWeight.bold),
                  ),
                  Spacer()
                ],
              ),
            ),
            onTap: () {
              _signInNaver(context);
            },
          ),
          Spacer()
        ],
      ),
    );
  }

  void _signInKakao(context) async {
    final container = ProviderContainer(); // ProviderContainer 생성

    OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
    Logger().d("token: ${token.accessToken}");

     // 로그인
    LoginReqDTO loginReqDTO = LoginReqDTO(socialName: "카카오톡");
    container.read(sessionStore).login(loginReqDTO, token.accessToken);

  }

  void _signInNaver(context) async {
    final container = ProviderContainer(); // ProviderContainer 생성

    await FlutterNaverLogin.logIn();
    NaverAccessToken token = await FlutterNaverLogin.currentAccessToken;
    Logger().d("token: ${token.accessToken}");


    LoginReqDTO loginReqDTO = LoginReqDTO(socialName: "네이버");
    // 로그인
    container.read(sessionStore).login(loginReqDTO, token.accessToken);


  }
}
