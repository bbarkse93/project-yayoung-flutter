import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/size.dart';

class CampsiteInfoForm extends StatelessWidget {
  final String campsiteImage;
  final String campsite;
  final String campsiteAddress;
  final int campsitePriceMin;
  final int campsitePriceMax;
  final String run;

  const CampsiteInfoForm({
    super.key,
    required this.campsiteImage,
    required this.campsite,
    required this.campsiteAddress,
    required this.campsitePriceMin,
    required this.campsitePriceMax,
    required this.run,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover, // 이미지가 컨테이너를 꽉 채우도록 설정
          image: AssetImage('${campsiteImage}'), // 이미지 경로 설정
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(gapMain),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "${campsite}",
              style: title1(mColor: kBackWhite),
            ),
            SizedBox(height: gapXSmall),
            Text(
              "${campsiteAddress}",
              style:
                  subTitle1(mColor: kBackWhite, mFontWeight: FontWeight.normal),
            ),
            SizedBox(height: gapXSmall),
            Text(
              "${campsitePriceMin} ~ ${campsitePriceMax}",
              style:
                  subTitle1(mColor: kBackWhite, mFontWeight: FontWeight.normal),
            ),
            SizedBox(height: gapXSmall),
            Text(
              "${run}",
              style: subTitle1(mColor: kBackWhite),
            ),
          ],
        ),
      ),
    );
  }
}
