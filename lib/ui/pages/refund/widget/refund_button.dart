import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/move.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/data/dto/refund_request_dto.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/repository/refund_repository.dart';
import 'package:team_project/ui/pages/refund/refund_view_model.dart';
import 'package:tuple/tuple.dart';

class RefundButton extends ConsumerWidget {
  final int campId;
  final int orderId;

  const RefundButton(this.campId, this.orderId, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final refundViewModel = ref.watch(refundProvider(Tuple2(campId, orderId)));
    return FractionallySizedBox(
      widthFactor: 0.7, // 원하는 비율로 조절
      child: InkWell(
        onTap: () {
          RefundReqDTO reqDTO = RefundReqDTO(
              orderId: orderId,
              orderNumber:"${refundViewModel!.refund!.orderNumber ?? 0}",
              refund: "${refundViewModel!.refund!.totalPrice ?? 0}",
          );

          ref.read(refundProvider(Tuple2(campId, orderId)).notifier)
              .refundRequest(reqDTO);
        },
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              color: kFontRed, borderRadius: BorderRadius.circular(gapSmall)),
          child: Center(
            child: Text(
              "환불하기",
              style: subTitle1(mColor: kBackWhite),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showAlertDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: kBackWhite,
          title: Center(
            child: Column(
              children: [
                SizedBox(height: gapMain),
                Text(
                  '환불이 완료되었습니다',
                  style: subTitle1(mColor: kFontRed),
                ),
              ],
            ),
          ),
          actions: [
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.popAndPushNamed(
                      context, Move.myCampingSchedulePage);
                },
                child: Text(
                  '확인',
                  style: subTitle1(mColor: kFontContent),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
