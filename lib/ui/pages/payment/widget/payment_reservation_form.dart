import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/pages/payment/payment_view_model.dart';

class PaymentReservationForm extends ConsumerWidget {
  final int campId;

  const PaymentReservationForm({required this.campId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reservationData = ref.watch(reservationDataProvider);

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
                  "${reservationData.startDate} ~ ${reservationData.endDate}(${reservationData.nights}박)",
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
                  "${reservationData.campField}",
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
                  "₩${reservationData.totalAmount}",
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
