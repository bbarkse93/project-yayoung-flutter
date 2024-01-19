import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/model/refund.dart';
import 'package:team_project/data/model/reservation.dart';
import 'package:team_project/data/repository/refund_repository.dart';
import 'package:team_project/data/repository/reservation_repository.dart';
import 'package:team_project/main.dart';


class RefundModel {
  Refund? refund;

  RefundModel(this.refund);
}

//창고
class RefundViewModel extends StateNotifier<RefundModel?> {
  RefundViewModel(this.campId, this.ref) : super(null);

  final int campId;
  final Ref ref;

  final mContext = navigatorKey.currentContext;

  Future<void> notifyInit() async {
    ResponseDTO responseDTO =
    await RefundRepository().fetchRefund(campId);

    if (responseDTO.success) {
      dynamic reservation = responseDTO.response;
      List<Refund> selectedCampFields = [];

      // 여기에서 기존에 선택된 데이터에 대한 처리를 수행할 수 있습니다.

      state = RefundModel(refund);
    } else {
      Logger().e("통신 에러: 유효하지 않은 데이터 구조입니다.");
    }
  }
}

//창고 관리자
final refundProvider =
StateNotifierProvider.family<RefundViewModel, RefundModel?, int>(
        (ref, campId) {
      return RefundViewModel(campId, ref)..notifyInit();
    });
