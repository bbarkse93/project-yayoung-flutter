import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/pages/refund/widget/campsite_info_form.dart';
import 'package:team_project/ui/pages/refund/widget/refund_button.dart';
import 'package:team_project/ui/pages/refund/widget/refund_reservation_form.dart';
import 'package:team_project/ui/pages/refund/widget/refund_rule_form.dart';

class RefundPageBody extends StatelessWidget {
  const RefundPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CampsiteInfoForm(
            campsiteImage: "assets/images/tent1.png",
            campsite: "물가솔솔캠핑장",
            campsiteAddress: "강원도 홍천 내면 광원리 471-4",
            campsitePriceMin: 45000,
            campsitePriceMax: 55000,
            run: "운영중"),
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
              RefundReservationForm(
                  startDate: "2024-01-12",
                  endDate: "2024-01-14",
                  area: "A1",
                  refundPrice: 100000),
              SizedBox(height: gapXLarge),
              RefundRuleForm(),
            ],
          ),
        ),
        SizedBox(height: gapXLarge),
        RefundButton(),
        SizedBox(height: gapXLarge),
      ],
    );
  }
}
