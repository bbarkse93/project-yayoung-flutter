import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';

class MyScheduleForm extends StatelessWidget {
  final String date;
  final String dDay;
  final String campsite;
  final String campsiteAddress;
  final String weather;

  const MyScheduleForm({
    super.key,
    required this.date,
    required this.dDay,
    required this.campsite,
    required this.campsiteAddress,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kBackLightGray, borderRadius: BorderRadius.circular(gapMain)),
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(gapMain),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "${date}",
                      style: subTitle1(mFontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: gapMain),
                    Text(
                      "${dDay}",
                      style: subTitle2(
                          mColor: kFontContent, mFontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: iconClose(),
                ),
              ],
            ),
            SizedBox(height: gapMain),
            Text(
              "${campsite}",
              style: subTitle2(),
            ),
            SizedBox(height: gapXSmall),
            Text(
              "${campsiteAddress}",
              style: subTitle2(mFontWeight: FontWeight.normal),
            ),
            SizedBox(height: gapLarge),
            Text(
              "${weather}",
              style:
                  subTitle2(mColor: kFontContent, mFontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
