import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/pages/payment/payment_view_model.dart';
import 'package:team_project/ui/pages/payment/widget/kakao_payment.dart';
import 'package:team_project/ui/pages/payment/widget/payment_button.dart';
import 'package:team_project/ui/pages/payment/widget/payment_reservation_form.dart';
import 'package:team_project/ui/pages/payment/widget/payment_terms_form.dart';
import 'package:team_project/ui/pages/refund/widget/campsite_info_form.dart';

class PaymentPage extends StatefulWidget {
  final int campId;

  const PaymentPage({Key? key, required this.campId}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isChecked1 = false;
  bool isChecked2 = false;

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
          '결제',
          style: subTitle1(),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          CampsiteInfoForm(campId: widget.campId),
          SizedBox(height: gapLarge),
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
                PaymentReservationForm(campId: widget.campId, reservationData: ReservationData()),
                SizedBox(height: gapXLarge),
                Text(
                  "약관동의",
                  style: subTitle1(),
                ),
                SizedBox(height: gapSmall),
                PaymentTermsForm(
                  onCheckboxChanged: (bool isChecked1, bool isChecked2) {
                    setState(() {
                      this.isChecked1 = isChecked1;
                      this.isChecked2 = isChecked2;
                    });
                  },
                ),
                SizedBox(height: gapXLarge),
                PaymentButton(
                  onPressed: () {
                    if (isChecked1 && isChecked2) {
                      // 약관 동의가 모두 선택된 경우에만 onPressed 로직 추가
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => KakaoPayment()),
                      );
                    } else {
                      // 약관 동의가 하나라도 선택되지 않은 경우 스낵바 표시
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('약관에 동의해주세요.'),
                          duration: Duration(seconds: 2),
                          action: SnackBarAction(
                            label: '확인',
                            textColor: kPrimaryColor,
                            onPressed: () {
                              // 스낵바 액션을 클릭할 때의 동작 추가
                            },
                          ),
                        ),
                      );
                    }
                  },
                  isChecked1: isChecked1,
                  isChecked2: isChecked2,
                ),
                // PaymentSuccessButton(),
                SizedBox(height: gapXLarge),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
