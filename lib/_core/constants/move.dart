import 'package:flutter/material.dart';
import 'package:team_project/ui/pages/auth/login_page.dart';
import 'package:team_project/ui/pages/campsite/campsite_detail/campsite_detail_page.dart';
import 'package:team_project/ui/pages/campsite/campsite_list/campsite_list_page.dart';
import 'package:team_project/ui/pages/campsite/search_campsite/search_campsite_page.dart';
import 'package:team_project/ui/pages/home/home_page.dart';
import 'package:team_project/ui/pages/my_page/like_page/like_page.dart';
import 'package:team_project/ui/pages/my_page/main_page.dart';
import 'package:team_project/ui/pages/my_page/notice_page/notice_page.dart';
import 'package:team_project/ui/pages/my_page/setting/setting_page.dart';
import 'package:team_project/ui/pages/my_page/user_update/user_update.dart';
import 'package:team_project/ui/pages/my_camping_list/my_camping_list_page.dart';
import 'package:team_project/ui/pages/my_camping_schedule/my_camping_schedule_page.dart';
import 'package:team_project/ui/pages/payment/payment_page.dart';
import 'package:team_project/ui/pages/refund/refund_page.dart';
import 'package:team_project/ui/pages/reservation/reservation_page.dart';

import 'package:team_project/ui/pages/splash/splash_page.dart';

class Move {
  static String loginPage = "/login";
  static String splashPage = "/splash";
  static String homePage = "/home";
  static String myCampingSchedule = "/myCampingSchedule";
  static String myCampingSchedulePage = "/myCampingSchedule";  // 바텀바
  static String myCampingListPage = "/myCampingList";
  static String mainScreenPage = "/mainScreenPage";
  static String searchCampsitePage = "/searchCampsite";  // 캠핑장 검색
  static String userUpdatePage = "/userUpdate";  // 업데이트
  static String settingPage = "/settingPage";  // My페이지 설정
  static String likePage = "/likePage";  // My페이지 설정
  static String noticePage = "/noticePage";  // My페이지 설정

  // 캠핑장 디테일
  static String campsiteDetailPage = "/campsiteDetail";
  // 캠핑장 목록
  static String campsiteListPage = "/campsiteList";



  static String refundPage = "/refund";
  static String datePage = "/date";
  static String reservationPage = "/reservation";
  static String paymentPage = "/payment";

}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    Move.loginPage: (p0) => LoginPage(),
    Move.mainScreenPage: (p0) => MainScreen(),
    Move.splashPage: (p0) => SplashPage(),
    Move.homePage: (p0) => HomePage(),
    Move.settingPage: (p0) => SettingPage(),
    Move.likePage: (p0) => LikePage(),
    Move.noticePage: (p0) => NoticePage(),
    Move.myCampingSchedule: (p0) => MyCampingSchedulePage(),

    Move.userUpdatePage:(p0) => UserUpdate(),
    Move.myCampingSchedulePage: (p0) => MyCampingSchedulePage(),
    Move.myCampingListPage: (p0) => MyCampingListPage(),

    Move.searchCampsitePage: (p0) => const SearchCampsitePage(),
    Move.campsiteDetailPage: (p0) => CampsiteDetailPage(),
    Move.campsiteListPage: (p0) => CampsiteListPage(),

    Move.refundPage: (p0) => RefundPage(),
    Move.reservationPage: (p0) => ReservationPage(),
    Move.paymentPage: (p0) => PaymentPage(),
  };
}
