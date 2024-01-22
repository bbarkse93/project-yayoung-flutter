import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/move.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/pages/payment/payment_view_model.dart';
import 'package:team_project/ui/pages/payment_success/payment_success_page_widgets/payment_success_button.dart';
import 'package:team_project/ui/pages/payment_success/payment_success_page_widgets/payment_success_reservation_form.dart';
import 'package:team_project/ui/pages/refund/refund-page_widgets/campsite_info_form.dart';
import 'package:team_project/ui/pages/reservation/reservation_page_widgets/campsite_area_map.dart';

class PaymentSuccessPage extends StatefulWidget {
  final int campId;

  const PaymentSuccessPage({Key? key, required this.campId}) : super(key: key);

  @override
  _PaymentSuccessPageState createState() => _PaymentSuccessPageState();
}

class _PaymentSuccessPageState extends State<PaymentSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        Navigator.pop(context);
        Navigator.pushReplacementNamed(
          context,
          Move.campsiteDetailPage,
          arguments: {'campId': widget.campId},
        );
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.popAndPushNamed(context, Move.homePage);
            },
            child: Image.asset(
              "assets/images/logo.png",
              width: 30,
              height: 15,
            ),
          ),
          title: Text(
            '예약완료',
            style: subTitle1(),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Move.campsiteDetailPage,
                    arguments: {'campId': widget.campId},
                  );
                },
                child: CampsiteInfoForm(campId: widget.campId)),
            SizedBox(height: gapLarge),
            CampsiteAreaMap(campId: widget.campId),
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
                  PaymentSuccessReservationForm(
                      campId: widget.campId, reservationData: ReservationData()),
                  SizedBox(height: gapXLarge),
                  PaymentSuccessButton(campId: widget.campId)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
