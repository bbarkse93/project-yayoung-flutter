// 1. 창고 데이터
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_project/data/model/camp.dart';
import 'package:team_project/main.dart';

class RequestParam {
  int? campDetailId;
  String? location;

  // 필요한 객체
  Camp? camp;

  RequestParam({
    this.campDetailId,
    this.location,
    this.camp,
  });
}

// 2. 창고 (비지니스 로직)
class ParamStore extends RequestParam {
  final mContext = navigatorKey.currentContext;
}

// 3. 창고 관리자
final paramProvider = Provider<ParamStore>((ref) {
  return ParamStore();
});