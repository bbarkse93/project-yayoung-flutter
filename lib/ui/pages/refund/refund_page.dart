import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/move.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/pages/refund/widget/campsite_info_form.dart';
import 'package:team_project/ui/pages/refund/widget/refund_page_appbar.dart';
import 'package:team_project/ui/pages/refund/widget/refund_reservation_form.dart';
import 'package:team_project/ui/pages/refund/widget/refund_rule_form.dart';

class RefundPage extends StatelessWidget {
  const RefundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RefundPageAppBar(),
      body: ListView(
        children: [
          CampsiteInfoForm(),
          SizedBox(height: gapXLarge),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: gapMain),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "예약내용",
                  style: subTitle1(),
                ),
                SizedBox(height: gapSmall),
                RefundReservationForm(),
                SizedBox(height: gapXLarge),
                RefundRuleForm(),
              ],
            ),
          ),
          SizedBox(height: gapXLarge),
          FractionallySizedBox(
            widthFactor: 0.7, // 원하는 비율로 조절
            child: InkWell(
              onTap: () {
                _showAlertDialog(context);
              },
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                    color: kFontRed,
                    borderRadius: BorderRadius.circular(gapSmall)),
                child: Center(
                  child: Text(
                    "환불하기",
                    style: title1(mColor: kBackWhite),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: gapXLarge),
        ],
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
                Text('환불이 완료되었습니다',
                  style: subTitle1(mColor: kFontRed),
                ),
              ],
            ),
          ),
          actions: [
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, Move.myCampingSchedulePage);
                },
                child: Text('확인',
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
