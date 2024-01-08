import 'package:flutter/material.dart';
import 'package:team_project/ui/pages/auth/login_page.dart';
import 'package:team_project/ui/pages/home/home_page.dart';
import 'package:team_project/ui/pages/my_page/main_page.dart';
import 'package:team_project/ui/pages/home/my_camping_list_page.dart';
import 'package:team_project/ui/pages/home/my_camping_schedule_page.dart';
import 'package:team_project/ui/pages/splash/splash_page.dart';

class Move {
  static String loginPage = "/login";
  static String splashPage = "/splash";
  static String homePage = "/home";
  static String myCampingSchedulePage = "/myCampingSchedule";
  static String myCampingListPage = "/myCampingList";
  static String mainScreenPage = "/mainScreenPage";
  //캠핑장 검색
  static String searchCampsitePage = "/searchCampsite";
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    Move.loginPage: (p0) => LoginPage(),
    Move.mainScreenPage: (p0) => MainScreen(),
    Move.splashPage: (p0) => SplashPage(),
    Move.homePage: (p0) => HomePage(),
    Move.myCampingSchedulePage: (p0) => MyCampingSchedulePage(),
    Move.myCampingListPage: (p0) => MyCampingListPage()
  };
}
