import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/_core/constants/move.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/data/dto/refund_request_dto.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/model/refund.dart';
import 'package:team_project/data/repository/refund_repository.dart';
import 'package:team_project/main.dart';
import 'package:team_project/ui/pages/my_camping_schedule/my_camping_schedule_view_model.dart';
import 'package:tuple/tuple.dart';

class RefundModel {
  Refund? refund;

  RefundModel(this.refund);
}

class RefundViewModel extends StateNotifier<RefundModel?> {
  RefundViewModel(this.campId, this.orderId, this.ref) : super(null);

  final int orderId;
  final int campId;
  Ref ref;

  final mContext = navigatorKey.currentContext;

  Future<void> notifyInit() async {
    Logger().d("뷰모델 진입");
    String jwt = await secureStorage.read(key: 'jwt') as String;
    ResponseDTO responseDTO = await RefundRepository().fetchRefundPage(campId, orderId, jwt);

    if (responseDTO.success) {
      dynamic refund = responseDTO.response;

      state = RefundModel(refund);
    } else {
      Logger().e("통신 에러: 유효하지 않은 데이터 구조입니다.");
    }
  }

  Future<void> refundRequest(BuildContext context, RefundReqDTO reqDTO) async {
    ResponseDTO response = await RefundRepository().fetchRefund(reqDTO);
    // 환불이 성공한 경우에만 다이얼로그를 보여줌
    if (response.success) {
      ref.read(myCampingScheduleProvider.notifier).notifyInit();
      _showRefundAlertDialog(context);
    } else {
      print("환불 실패");
    }

  }
  Future<void> _showRefundAlertDialog(BuildContext context) async {
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

final refundProvider = StateNotifierProviderFamily<
    RefundViewModel, RefundModel?, Tuple2<int, int>>(
      (ref, tuple) {
    final campId = tuple.item1;
    final orderId = tuple.item2;
    return RefundViewModel(campId, orderId, ref)..notifyInit();
  },
);
