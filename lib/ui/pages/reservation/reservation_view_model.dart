
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/model/reservation.dart';
import 'package:team_project/data/repository/reservation_repository.dart';
import 'package:team_project/main.dart';

class CampFieldDTO {
  final String fieldName;
  final String price;

  CampFieldDTO({
    required this.fieldName,
    required this.price,
  });

  factory CampFieldDTO.fromJson(Map<String, dynamic> json) =>
      CampFieldDTO(fieldName: json["fieldName"], price: json["price"]);
}

class ReservationModel {
  Reservation reservation;

  ReservationModel(this.reservation);
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

      state = ReservationModel(reservation);
    } else {
      Logger().e("통신 에러: 유효하지 않은 데이터 구조입니다.");
      // 사용자에게 에러 메시지를 표시하거나 적절하게 처리
    }
  }

  // Future<ResponseDTO> fetchReservation(int? campId) async {
  //   try {
  //     // 통신
  //     Logger().d("id는? $campId");
  //     Response response = await dio.get("/order/field-list?campId=${campId}");
  //     // 응답 받은 데이터 파싱
  //     ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
  //     Logger().d("그만둬 ${responseDTO.response}");
  //
  //     responseDTO.response = Reservation();
  //
  //     return responseDTO;
  //   } catch (e) {
  //     return ResponseDTO(false, "예약페이지 불러오기 실패", null);
  //   }
  // }
}

//창고 관리자
final reservationProvider =
    StateNotifierProvider.family<ReservationViewModel, ReservationModel?, int>(
        (ref, campId) {
  return ReservationViewModel(campId, ref)..notifyInit();
});

// final reservationProvider =
// StateNotifierProvider.family<ReservationViewModel, ReservationModel?, int>(
//         (ref, campId) {
//       return ReservationViewModel(campId, ref)..fetchReservation(campId);
//     });
