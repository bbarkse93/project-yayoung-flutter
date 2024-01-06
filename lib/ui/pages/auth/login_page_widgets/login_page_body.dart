import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:team_project/_core/constants/color.dart';
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
            onTap: () {},
          ),
          Spacer()
        ],
      ),
    );
  }
}
