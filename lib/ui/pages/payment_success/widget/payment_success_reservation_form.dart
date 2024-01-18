import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/pages/payment/payment_view_model.dart';

class PaymentSuccessReservationForm extends ConsumerWidget {
  final int campId;
  final ReservationData reservationData;

  const PaymentSuccessReservationForm({required this.campId, required this.reservationData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reservationData = ref.read(reservationDataProvider);
    final dateFormatter = DateFormat('yyyy-MM-dd');

    // nullable한 DateTime 속성 다루기
    final startDate = reservationData.startDate ?? DateTime.now();
    final endDate = reservationData.endDate ?? DateTime.now();

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
                  "${dateFormatter.format(startDate)} ~ ${dateFormatter.format(endDate)}(${reservationData.nights}박)",
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
