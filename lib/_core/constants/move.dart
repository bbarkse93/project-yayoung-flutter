import 'package:flutter/material.dart';
import 'package:team_project/ui/pages/auth/login_page.dart';
import 'package:team_project/ui/pages/home/home_page.dart';
import 'package:team_project/ui/pages/home/my_camping_list.dart';
import 'package:team_project/ui/pages/home/my_camping_schedule.dart';
import 'package:team_project/ui/pages/my_page/MainScreen.dart';
import 'package:team_project/ui/pages/splash/splash_page.dart';

class Move {
  static String loginPage = "/login";
  static String splashPage = "/splash";
  static String homePage = "/home";
  static String myCampingSchedule = "/myCampingSchedule";
  static String myCampingList = "/myCampingList";
  static String mainScreenPage = "/mainScreenPage";
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    Move.loginPage: (p0) => LoginPage(),
    Move.mainScreenPage: (p0) => MainScreen(),
    Move.splashPage: (p0) => SplashPage(),
    Move.homePage: (p0) => HomePage(),
    Move.myCampingSchedule: (p0) => MyCampingSchedule(),
    Move.myCampingList: (p0) => MyCampingList()
  };
}
