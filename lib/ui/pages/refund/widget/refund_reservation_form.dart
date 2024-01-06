import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/size.dart';

class RefundReservationForm extends StatelessWidget {
  const RefundReservationForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(gapSmall),
        border: Border.all(color: Colors.grey),
      ),
      child: Padding(
        padding: const EdgeInsets.all(gapMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("예약정보",
              style: subTitle2(),
            ),
            SizedBox(height: gapSmall),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("선택한 날짜",
                  style: subTitle3(mFontWeight: FontWeight.normal),
                ),
                Text("2024-01-12 ~ 2024-01-14(2박)",
                  style: subTitle3(mFontWeight: FontWeight.normal),
                ),
              ],
            ),
            SizedBox(height: gapSmall),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("선택한 구역",
                  style: subTitle3(mFontWeight: FontWeight.normal),
                ),
                Text("A1",
                  style: subTitle3(mFontWeight: FontWeight.normal),
                ),
              ],
            ),
            SizedBox(height: gapSmall),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("총 환불 금액",
                  style: subTitle2(mColor: kFontRed),
                ),
                Text("₩100,000",
                  style: subTitle2(mColor: kFontRed),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
