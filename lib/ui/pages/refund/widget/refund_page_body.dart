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
        CampsiteInfoForm(campId: 1),
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
                  countDay: 2,
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
