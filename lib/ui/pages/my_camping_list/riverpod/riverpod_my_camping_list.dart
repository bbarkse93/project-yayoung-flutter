import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_project/data/dto/request_dto/my_camping_list_request_dto.dart';

final myCampingListProvider =
    NotifierProvider<MyCampingListNotifier, List<MyCampingDTO>>(
  () => MyCampingListNotifier(),
);

class MyCampingListNotifier extends Notifier<List<MyCampingDTO>> {

  int index = 0;

  @override
  List<MyCampingDTO> build() {
    return state;
  }

  void setIndex(int newIndex) {
    index = newIndex;
     ();
  }
}
