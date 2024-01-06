import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/move.dart';
import 'package:team_project/_core/constants/size.dart';

class RefundButton extends StatelessWidget {
  const RefundButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.7, // 원하는 비율로 조절
      child: InkWell(
        onTap: () {
          _showAlertDialog(context);
        },
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              color: kFontRed, borderRadius: BorderRadius.circular(gapSmall)),
          child: Center(
            child: Text(
              "환불하기",
              style: title1(mColor: kBackWhite),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showAlertDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: kBackWhite,
          title: Center(
            child: Column(
              children: [
                SizedBox(height: gapMain),
                Text(
                  '환불이 완료되었습니다',
                  style: subTitle1(mColor: kFontRed),
                ),
              ],
            ),
          ),
          actions: [
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.popAndPushNamed(
                      context, Move.myCampingSchedulePage);
                },
                child: Text(
                  '확인',
                  style: subTitle1(mColor: kFontContent),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
