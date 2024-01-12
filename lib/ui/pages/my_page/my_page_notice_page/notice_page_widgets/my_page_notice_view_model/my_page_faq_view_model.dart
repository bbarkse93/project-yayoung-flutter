
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/repository/faq_repository.dart';

class FaqModel {

  late List<PaymentDTO>? paymentDTOList; // List
  late List<UserDTO>? userDTOList; // List

  FaqModel({
    this.paymentDTOList, this.userDTOList
  });

  factory FaqModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> tempPayment = json["paymentDTOList"];
    List<dynamic> tempUser = json["userDTOList"];
    List<PaymentDTO> paymentDTOList = tempPayment.map((e) => PaymentDTO.fromJson(e)).toList();
    List<UserDTO> userDTOList = tempUser.map((e) => UserDTO.fromJson(e)).toList();

    return FaqModel(
      paymentDTOList: paymentDTOList,userDTOList: userDTOList // Object
    );
  }
}

class PaymentDTO {
  int? faqId;
  String? title;
  String? content;

  PaymentDTO({
    this.faqId,
    this.title,
    this.content,
  });

  factory PaymentDTO.fromJson(Map<String, dynamic> json) =>
      PaymentDTO(
        faqId: json["faqId"],
        title: json["title"],
        content: json["content"],
      );
}

class UserDTO {
  int? faqId;
  String? title;
  String? content;

  UserDTO({
    this.faqId,
    this.title,
    this.content,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      UserDTO(
        faqId: json["faqId"],
        title: json["title"],
        content: json["content"],
      );
}


// 창고
class FaqViewModel extends StateNotifier<FaqModel?> {
  Ref ref;
  FaqViewModel(super._state, this.ref);

  Future<void> notifyInit() async {
    // SessionUser sessionUser = ref.read(sessionStore);
    //TODO 언약 : 세션에서 토큰 꺼내서 info 넘기기
    ResponseDTO responseDTO = await FaqRepository().fetchFaqInfo();
    Logger().d("값 받니? ${responseDTO.response}");
    FaqModel model = responseDTO.response;
    state = FaqModel(paymentDTOList: model.paymentDTOList, userDTOList: model.userDTOList);
    Logger().d("상태 : ${state?.paymentDTOList},  ${state?.userDTOList}");
  }
}

// 창고 관리자
final faqProvider = StateNotifierProvider.autoDispose<
    FaqViewModel, FaqModel?>((ref) {
  return FaqViewModel(null, ref)..notifyInit();
});

