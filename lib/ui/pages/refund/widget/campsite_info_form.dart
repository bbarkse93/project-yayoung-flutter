import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/size.dart';

class CampsiteInfoForm extends StatelessWidget {
  const CampsiteInfoForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover, // 이미지가 컨테이너를 꽉 채우도록 설정
          image: AssetImage('assets/images/tent1.png'), // 이미지 경로 설정
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(gapMain),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "물가솔캠핑장",
              style: title1(mColor: kBackWhite),
            ),
            SizedBox(height: gapXSmall),
            Text(
              "강원도 홍천 내면 광원리 471-4",
              style: subTitle1(
                  mColor: kBackWhite, mFontWeight: FontWeight.normal),
            ),
            SizedBox(height: gapXSmall),
            Text(
              "45,000 ~ 55,000",
              style: subTitle1(
                  mColor: kBackWhite, mFontWeight: FontWeight.normal),
            ),
            SizedBox(height: gapXSmall),
            Text(
              "운영중",
              style: subTitle1(mColor: kBackWhite),
            ),
          ],
        ),
      ),
    );
  }
}
