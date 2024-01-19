import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team_project/data/dto/refund_request_dto.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/model/refund.dart';
import 'package:team_project/data/repository/refund_repository.dart';
import 'package:team_project/main.dart';
import 'package:tuple/tuple.dart'; // 올바른 import 문 추가

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
    ResponseDTO responseDTO = await RefundRepository().fetchRefundPage(campId, orderId);

    if (responseDTO.success) {
      dynamic refund = responseDTO.response;

      state = RefundModel(refund);
    } else {
      Logger().e("통신 에러: 유효하지 않은 데이터 구조입니다.");
    }
  }

  Future<void> refundRequest(RefundReqDTO reqDTO) async {
    ResponseDTO response = await RefundRepository().fetchRefund(reqDTO);
    // 환불이 성공한 경우에만 다이얼로그를 보여줌
    if (response.success) {
      // _showAlertDialog(context);
    } else {
      print("환불 실패");
    }
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
