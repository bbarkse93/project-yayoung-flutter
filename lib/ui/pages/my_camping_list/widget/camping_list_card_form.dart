import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';

class CampingListCardForm extends StatelessWidget {
  final String campingImage;
  final String campsite;
  final String campsiteAddress;
  final String startDate;
  final String endDate;
  final String rating;
  final int index;

  const CampingListCardForm({
    super.key,
    required this.campingImage,
    required this.campsite,
    required this.campsiteAddress,
    required this.startDate,
    required this.endDate,
    required this.rating,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(gapMain),
        image: DecorationImage(
          fit: BoxFit.cover, // 이미지가 컨테이너를 꽉 채우도록 설정
          image: AssetImage('${campingImage}'), // 이미지 경로 설정
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: gapLarge, vertical: gapXLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '# ${index+1}',
              style: subTitle2(mColor: kBackWhite),
            ),
            SizedBox(height: gapXSmall),
            Text(
              '${campsite}',
              style: title1(mColor: kBackWhite),
            ),
            SizedBox(height: gapXSmall),
            Text(
              '${campsiteAddress}',
              style: subTitle3(mColor: kBackWhite),
            ),
            SizedBox(height: gapXSmall),
            Text(
              '${startDate} - ${endDate}',
              style: subTitle3(mColor: kBackWhite),
            ),
            SizedBox(height: gapSmall),
            Row(
              children: List.generate(
                int.parse(rating),
                    (index) => iconFullStar(mColor: kBackWhite),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
