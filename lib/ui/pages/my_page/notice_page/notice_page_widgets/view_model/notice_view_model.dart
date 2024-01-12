
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/repository/notice_repository.dart';

class NoticeModel {

  late List<NoticeDTO>? noticeDTOList; // List

  NoticeModel({
    this.noticeDTOList,
  });

  factory NoticeModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> temp = json["noticeDTOList"];
    List<NoticeDTO> noticeDTOList =
    temp.map((e) => NoticeDTO.fromJson(e)).toList();

    return NoticeModel(
      noticeDTOList: noticeDTOList, // Object
    );
  }
}

class NoticeDTO {
  int? noticeId;
  String? title;
  String? content;
  String? createdAt;

  NoticeDTO({
    this.noticeId,
    this.title,
    this.content,
    this.createdAt,
  });

  factory NoticeDTO.fromJson(Map<String, dynamic> json) =>
      NoticeDTO(
        noticeId: json["noticeId"],
        title: json["title"],
        content: json["content"],
        createdAt: json["createdAt"],
      );
}


// 창고
class NoticeViewModel extends StateNotifier<NoticeModel?> {
  Ref ref;
  NoticeViewModel(super._state, this.ref);

  Future<void> notifyInit() async {
    // SessionUser sessionUser = ref.read(sessionStore);
    //TODO 언약 : 세션에서 토큰 꺼내서 info 넘기기
    ResponseDTO responseDTO = await NoticeRepository().fetchNoticeInfo();
    Logger().d("값 받니? ${responseDTO.response}");
    NoticeModel model = responseDTO.response;
    state = NoticeModel(noticeDTOList: model.noticeDTOList);
    Logger().d("상태 : ${state?.noticeDTOList}");
  }
}

// 창고 관리자
final noticeProvider = StateNotifierProvider.autoDispose<
    NoticeViewModel, NoticeModel?>((ref) {
  return NoticeViewModel(null, ref)..notifyInit();
});

