import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/pages/payment/widget/payment_button.dart';
import 'package:team_project/ui/pages/payment/widget/payment_reservation_form.dart';
import 'package:team_project/ui/pages/payment/widget/payment_success_button.dart';
import 'package:team_project/ui/pages/payment/widget/payment_terms_form.dart';
import 'package:team_project/ui/pages/refund/widget/campsite_info_form.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: iconArrowBack()),
        title: Text(
          '결제',
          style: subTitle1(),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          CampsiteInfoForm(campId: 1),
          SizedBox(height: gapMain),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: gapMain),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "예약정보",
                  style: subTitle1(),
                ),
                SizedBox(height: gapSmall),
                PaymentReservationForm(
                    startDate: "2024-01-12",
                    endDate: "2024-01-14",
                    countDay: 2,
                    area: "A1",
                    refundPrice: 100000),
                SizedBox(height: gapXLarge),
                Text(
                  "약관동의",
                  style: subTitle1(),
                ),
                SizedBox(height: gapSmall),
                PaymentTermsForm(),
                SizedBox(height: gapXLarge),
                PaymentButton(),
                // PaymentSuccessButton(),
                SizedBox(height: gapXLarge),
              ],
            ),
          )
        ],
      ),
    );
  }
}
