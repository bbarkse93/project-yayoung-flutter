import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/pages/refund/refund_view_model.dart';
import 'package:tuple/tuple.dart';

class RefundReservationForm extends ConsumerWidget {
  final int orderId;
  final int campId;

  const RefundReservationForm(this.campId, this.orderId, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final refundViewModel = ref.watch(refundProvider(Tuple2(campId, orderId)));
    Logger().d("결제내용 출력 ${refundViewModel!.refund.toString()}");

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
                  "${refundViewModel?.refund?.checkInDate} ~ ${refundViewModel?.refund?.checkOutDate}/${refundViewModel?.refund?.nights}박",
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
                  "${refundViewModel?.refund?.fieldName}",
                  style: subTitle3(mFontWeight: FontWeight.normal),
                ),
              ],
            ),
            SizedBox(height: gapSmall),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "총 환불 금액",
                  style: subTitle2(mColor: kFontRed),
                ),
                Text(
                  "₩${refundViewModel?.refund?.totalPrice}",
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
