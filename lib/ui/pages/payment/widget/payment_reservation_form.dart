import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/size.dart';

class PaymentReservationForm extends StatelessWidget {
  final String startDate;
  final String endDate;
  final String area;
  final int refundPrice;
  final int countDay;

  const PaymentReservationForm({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.area,
    required this.refundPrice,
    required this.countDay,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(gapSmall),
        border: Border.all(color: Colors.grey),
      ),
      child: Padding(
        padding: const EdgeInsets.all(gapMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "예약정보",
              style: subTitle2(),
            ),
            SizedBox(height: gapSmall),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "선택한 날짜",
                  style: subTitle3(mFontWeight: FontWeight.normal),
                ),
                Text(
                  "${startDate} ~ ${endDate}/${countDay}박",
                  style: subTitle3(mFontWeight: FontWeight.normal),
                ),
              ],
            ),
            SizedBox(height: gapSmall),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "선택한 구역",
                  style: subTitle3(mFontWeight: FontWeight.normal),
                ),
                Text(
                  "${area}",
                  style: subTitle3(mFontWeight: FontWeight.normal),
                ),
              ],
            ),
            SizedBox(height: gapSmall),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "총 결제 금액",
                  style: subTitle2(),
                ),
                Text(
                  "₩${refundPrice}",
                  style: subTitle2(),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
