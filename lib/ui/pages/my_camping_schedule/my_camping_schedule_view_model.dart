import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/model/user.dart';
import 'package:team_project/data/repository/my_camping_schedule_repository.dart';
import 'package:team_project/data/store/session_user.dart';
import 'package:team_project/main.dart';

class MyCampingScheduleDTO {
  final String campName;
  final String campAddress;
  final String checkInDate;
  final String checkInDDay;
  final String campField;

  MyCampingScheduleDTO({
    required this.campName,
    required this.campAddress,
    required this.checkInDate,
    required this.checkInDDay,
    required this.campField,
  });

  factory MyCampingScheduleDTO.fromJson(Map<String, dynamic> json) => MyCampingScheduleDTO(
    campName: json["campName"],
    campAddress: json["campAddress"],
    checkInDate: json["checkInDate"],
    checkInDDay: json["checkInDDay"],
    campField: json["campField"],
  );

  Map<String, dynamic> toJson() => {
    "campName": campName,
    "campAddress": campAddress,
    "checkInDate": checkInDate,
    "checkInDDay": checkInDDay,
    "campField": campField,
  };
}

class MyCampingScheduleModel {
  List<MyCampingScheduleDTO> campingScheduleList;

  MyCampingScheduleModel(this.campingScheduleList);
}

// 2. 창고
class MyCampingScheduleViewModel extends StateNotifier<MyCampingScheduleModel?> {
  MyCampingScheduleViewModel(this.ref) : super(MyCampingScheduleModel([]));
  final formKey = GlobalKey<FormState>();
  final mContext = navigatorKey.currentContext;
  Ref ref;

  Future<void> notifyInit() async {
    String jwt = await secureStorage.read(key: 'jwt') as String;

    Logger().d("화면 초기화 ${jwt}");
    Logger().d("화면 초기화");
    // Logger().d("my_camping_schedule 토큰 값 전달한다 ${sessionUser.jwt}");
    ResponseDTO responseDTO = await MyCampingScheduleRepository().fetchMyCampingSchedule(jwt);

    Logger().d("response는 ?? $responseDTO");

    if (responseDTO.success) {
      dynamic responseData = responseDTO.response;

      if (responseData is MyCampingScheduleModel) {
        // 이미 MyCampingScheduleModel로 왔을 경우에는 그대로 사용
        state = responseData;
      } else if (responseData is List<MyCampingScheduleDTO>) {
        state = MyCampingScheduleModel(responseData);
        Logger().d("state : $state");
      } else {
        Logger().e("통신 에러: 유효하지 않은 데이터 구조입니다.");
      }
    } else {
      Logger().e("통신 에러: ${responseDTO.error}");
    }
  }
}

// 3. 창고관리자
final myCampingScheduleProvider = StateNotifierProvider.autoDispose<
    MyCampingScheduleViewModel, MyCampingScheduleModel?>((ref) {
  return MyCampingScheduleViewModel(ref)..notifyInit();
});
