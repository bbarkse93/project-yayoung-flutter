import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/move.dart';
import 'package:team_project/_core/constants/size.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(gapMain),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Image.asset("assets/images/yayoung_logo.png"),
          Spacer(),
          InkWell(
            child: Container(
              decoration: BoxDecoration(color: kKakaoLogin, borderRadius: BorderRadius.circular(gapMedium)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: gapMedium, top: gapSmall, bottom: gapSmall),
                    child: SvgPicture.asset(
                      "assets/images/kakao_login.svg",
                      width: gapXLarge,
                      height: gapXLarge,
                    ),
                  ),
                  Spacer(),
                  const Text(
                    "카카오로 로그인",
                    style: TextStyle(fontSize: fontLarge, fontWeight: FontWeight.bold),
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
          InkWell(
            child: Container(
              decoration: BoxDecoration(color: kKakaoLogin, borderRadius: BorderRadius.circular(gapMedium)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: gapMedium, top: gapSmall, bottom: gapSmall),
                    child: SvgPicture.asset(
                      "assets/images/naver_login.svg",
                      width: gapXLarge,
                      height: gapXLarge,
                    ),
                  ),
                  Spacer(),
                  const Text(
                    "네이버로 로그인",
                    style: TextStyle(fontSize: fontLarge, fontWeight: FontWeight.bold),
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
    OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
    Logger().d("token: $token");

    final kakaoUser = await UserApi.instance.me();
    Logger().d("user 정보 : $kakaoUser");
    Navigator.pushNamed(context, Move.mainScreenPage);
  }

  void _signInNaver(context) async {
    final NaverLoginResult result = await FlutterNaverLogin.logIn();
    Logger().d(result);
    Navigator.pushNamed(context, Move.mainScreenPage);
  }
}
