import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/model/reservation.dart';
import 'package:team_project/data/repository/reservation_repository.dart';
import 'package:team_project/main.dart';

class CampFieldDTO {
  final String fieldName;
  final String price;
  bool isChecked;

  CampFieldDTO({
    required this.fieldName,
    required this.price,
    this.isChecked = false,
  });

  factory CampFieldDTO.fromJson(Map<String, dynamic> json) =>
      CampFieldDTO(fieldName: json["fieldName"], price: json["price"]);
}



class ReservationModel {
  Reservation reservation;
  List<CampFieldDTO> selectedCampFields;

  ReservationModel(this.reservation, this.selectedCampFields);


}

//창고
class ReservationViewModel extends StateNotifier<ReservationModel?> {
  ReservationViewModel(this.campId, this.ref) : super(null);

  final int campId;
  final Ref ref;

  final mContext = navigatorKey.currentContext;

  Future<void> notifyInit() async {
    ResponseDTO responseDTO =
    await ReservationRepository().fetchReservation(campId);

    if (responseDTO.success) {
      dynamic reservation = responseDTO.response;
      List<CampFieldDTO> selectedCampFields = [];

      // 여기에서 기존에 선택된 데이터에 대한 처리를 수행할 수 있습니다.

      state = ReservationModel(reservation, selectedCampFields);
    } else {
      Logger().e("통신 에러: 유효하지 않은 데이터 구조입니다.");
    }
  }

  // 이 부분을 추가합니다.
  void toggleSelection(CampFieldDTO campFieldDTO) {
    if (state != null) {
      if (state!.selectedCampFields.contains(campFieldDTO)) {
        state = ReservationModel(
          state!.reservation,
          List.from(state!.selectedCampFields)..remove(campFieldDTO),
        );
      } else {
        state = ReservationModel(
          state!.reservation,
          List.from(state!.selectedCampFields)..add(campFieldDTO),
        );
      }
    }
  }
}

//창고 관리자
final reservationProvider =
    StateNotifierProvider.family<ReservationViewModel, ReservationModel?, int>(
        (ref, campId) {
  return ReservationViewModel(campId, ref)..notifyInit();
});
