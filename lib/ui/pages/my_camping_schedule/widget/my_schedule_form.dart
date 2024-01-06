import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/move.dart';
import 'package:team_project/_core/constants/size.dart';

class MyScheduleForm extends StatelessWidget {
  final String startDate;
  final String dDay;
  final String campsite;
  final String campsiteAddress;

  const MyScheduleForm({
    super.key,
    required this.startDate,
    required this.dDay,
    required this.campsite,
    required this.campsiteAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kBackLightGray, borderRadius: BorderRadius.circular(gapMain)),
      height: 170,
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
                      "${startDate}",
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
                  onPressed: () {
                    _showAlertDialog(context);
                  },
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
          ],
        ),
      ),
    );
  }

  Future<void> _showAlertDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Column(
              children: [
                SizedBox(height: gapMain),
                Text('예약을 취소 하시겠습니까?',
                style: subTitle1(mColor: kFontRed),
                ),
              ],
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('아니요',
                  style: subTitle1(mColor: kFontContent),
                  ),
                ),
                Container(
                  color: kFontContent,
                  height: gapLarge,
                  width: 1,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Move.refundPage);
                  },
                  child: Text('예약 취소',
                    style: subTitle1(mColor: kFontRed, mFontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
