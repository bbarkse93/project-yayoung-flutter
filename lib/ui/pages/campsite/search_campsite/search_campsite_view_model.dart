import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/model/camp.dart';
import 'package:team_project/data/repository/campsite_list_repository.dart';
import 'package:team_project/main.dart';
class SearchModel {
  String? keyword;
  List<Camp>? campList;

  SearchModel({this.keyword, this.campList});
}

// 2. 창고
class SearchViewModel extends StateNotifier<SearchModel?> {
  SearchViewModel(super._state, this.ref);
  final mContext = navigatorKey.currentContext;
  Ref ref;

  void updateSearchKeyword(String newKeyword) {
    state = SearchModel(keyword: newKeyword ?? "", campList: state?.campList ?? []);
  }


  Future<void> campSearch() async {
    ResponseDTO responseDTO = await CampListRepository().fetchSearchCamp(state!.keyword!);
    Logger().d(responseDTO.response);
    state = SearchModel(campList: responseDTO.response);
  }

}

// 3. 창고 관리자
final searchProvider = StateNotifierProvider.autoDispose<SearchViewModel, SearchModel?>((ref) {
  return SearchViewModel(SearchModel(campList: []), ref);
});