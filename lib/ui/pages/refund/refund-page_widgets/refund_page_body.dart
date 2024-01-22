import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/pages/refund/refund-page_widgets/campsite_info_form.dart';
import 'package:team_project/ui/pages/refund/refund-page_widgets/refund_button.dart';
import 'package:team_project/ui/pages/refund/refund-page_widgets/refund_reservation_form.dart';
import 'package:team_project/ui/pages/refund/refund-page_widgets/refund_rule_form.dart';

class RefundPageBody extends StatelessWidget {
  final int campId;
  final int orderId;

  const RefundPageBody({
    super.key,
    required this.campId,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CampsiteInfoForm(campId: campId),
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
              RefundReservationForm(campId, orderId),
              SizedBox(height: gapXLarge),
              RefundRuleForm(),
            ],
          ),
        ),
        SizedBox(height: gapXLarge),
        RefundButton(campId, orderId),
        SizedBox(height: gapXLarge),
      ],
    );
  }
}
