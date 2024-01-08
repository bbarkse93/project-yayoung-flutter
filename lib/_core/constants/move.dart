import 'package:flutter/material.dart';
import 'package:team_project/ui/pages/auth/login_page.dart';
import 'package:team_project/ui/pages/campsite/search_campsite/search_campsite_page.dart';
import 'package:team_project/ui/pages/home/home_page.dart';
import 'package:team_project/ui/pages/my_page/main_page.dart';
import 'package:team_project/ui/pages/my_page/user_update/user_update.dart';
import 'package:team_project/ui/pages/home/my_camping_list_page.dart';
import 'package:team_project/ui/pages/home/my_camping_schedule_page.dart';
import 'package:team_project/ui/pages/splash/splash_page.dart';

class Move {
  static String loginPage = "/login";
  static String splashPage = "/splash";
  static String homePage = "/home";
  static String myCampingSchedule = "/myCampingSchedule";
  // 바텀바
  static String myCampingSchedulePage = "/myCampingSchedule";
  static String myCampingListPage = "/myCampingList";
  static String mainScreenPage = "/mainScreenPage";
  // 캠핑장 검색
  static String searchCampsitePage = "/searchCampsite";
  // 업데이트
  static String userUpdatePage = "/userUpdate";
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    Move.loginPage: (p0) => LoginPage(),
    Move.mainScreenPage: (p0) => MainScreen(),
    Move.splashPage: (p0) => SplashPage(),
    Move.homePage: (p0) => HomePage(),
    Move.myCampingSchedule: (p0) => MyCampingSchedulePage(),
    Move.searchCampsitePage: (p0) => const SearchCampsitePage(),
    Move.userUpdatePage:(p0) => const UserUpdate(),
    Move.myCampingSchedulePage: (p0) => MyCampingSchedulePage(),
    Move.myCampingListPage: (p0) => MyCampingListPage()
  };
}
