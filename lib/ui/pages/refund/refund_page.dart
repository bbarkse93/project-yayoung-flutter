import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
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
          Container(
            height: 60,
            width: 0,
            decoration: BoxDecoration(color: kFontRed),
            child: Center(
              child: Text(
                "환불하기",
                style: title1(mColor: kBackWhite),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



