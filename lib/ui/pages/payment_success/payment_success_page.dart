import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/pages/payment/payment_view_model.dart';
import 'package:team_project/ui/pages/payment/widget/kakao_payment.dart';
import 'package:team_project/ui/pages/payment/widget/payment_button.dart';
import 'package:team_project/ui/pages/payment/widget/payment_reservation_form.dart';
import 'package:team_project/ui/pages/payment/widget/payment_success_button.dart';
import 'package:team_project/ui/pages/payment/widget/payment_terms_form.dart';
import 'package:team_project/ui/pages/payment_success/widget/payment_success_reservation_form.dart';
import 'package:team_project/ui/pages/refund/widget/campsite_info_form.dart';
import 'package:team_project/ui/pages/reservation/widget/campsite_area_map.dart';

class PaymentSuccessPage extends StatefulWidget {
  final int campId;

  const PaymentSuccessPage({Key? key, required this.campId}) : super(key: key);

  @override
  _PaymentSuccessPageState createState() => _PaymentSuccessPageState();
}

class _PaymentSuccessPageState extends State<PaymentSuccessPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: iconArrowBack(),
        ),
        title: Text(
          '예약완료',
          style: subTitle1(),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          CampsiteInfoForm(campId: 1),
          SizedBox(height: gapLarge),
          CampsiteAreaMap(campId: 1),
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
                PaymentSuccessReservationForm(campId: widget.campId, reservationData: ReservationData()),
                SizedBox(height: gapXLarge),
                PaymentSuccessButton()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
