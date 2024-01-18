import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:team_project/data/store/param_store.dart';
import 'package:team_project/ui/pages/auth/login_page.dart';
import 'package:team_project/ui/pages/campsite/campsite_detail/campsite_detail_page.dart';
import 'package:team_project/ui/pages/campsite/campsite_list/campsite_list_page.dart';
import 'package:team_project/ui/pages/campsite/campsite_map/campsite_call.dart';
import 'package:team_project/ui/pages/campsite/campsite_map/campsite_map_page.dart';
import 'package:team_project/ui/pages/campsite/search_campsite/search_campsite_page.dart';
import 'package:team_project/ui/pages/home/home_page.dart';
import 'package:team_project/ui/pages/my_page/main_page.dart';
import 'package:team_project/ui/pages/my_camping_list/my_camping_list_page.dart';
import 'package:team_project/ui/pages/my_camping_schedule/my_camping_schedule_page.dart';
import 'package:team_project/ui/pages/my_page/my_page_like_page/my_page_like_page.dart';
import 'package:team_project/ui/pages/my_page/my_page_notice_page/my_page_notice_page.dart';
import 'package:team_project/ui/pages/my_page/my_page_setting/my_page_setting_page.dart';
import 'package:team_project/ui/pages/my_page/my_page_user_update/my_page_user_update.dart';
import 'package:team_project/ui/pages/payment/payment_page.dart';
import 'package:team_project/ui/pages/refund/refund_page.dart';
import 'package:team_project/ui/pages/reservation/reservation_page.dart';
import 'package:team_project/ui/pages/review/review_page.dart';

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
  static String campsiteMapPage = "/campsiteMap";
  static String campsiteCall = "/campsiteCall";
  // 캠핑장 목록
  static String campsiteListPage = "/campsiteList";



  static String refundPage = "/refund";
  static String datePage = "/date";
  static String reservationPage = "/reservation";
  static String paymentPage = "/payment";
  static String reviewPage = "/review";
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    Move.loginPage: (context) => LoginPage(),
    Move.mainScreenPage: (context) => MainScreen(),
    Move.splashPage: (context) => SplashPage(),
    Move.homePage: (context) => HomePage(),
    Move.settingPage: (context) => SettingPage(),
    Move.likePage: (context) => LikePage(),
    Move.noticePage: (context) => NoticePage(),
    Move.myCampingSchedule: (context) => MyCampingSchedulePage(),

    Move.userUpdatePage:(context) => UserUpdate(),
    Move.myCampingSchedulePage: (context) => MyCampingSchedulePage(),
    Move.myCampingListPage: (context) => MyCampingListPage(),

    Move.searchCampsitePage: (context) => const SearchCampsitePage(),
    // Move.campsiteDetailPage: (context) => CampsiteDetailPage(),
    Move.campsiteListPage: (context) => CampsiteListPage(),

    Move.refundPage: (context) => RefundPage(),
    Move.reservationPage: (context) {
      final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final campId = arguments['campId'] as int;
      return ReservationPage(campId: campId);
    },
    Move.paymentPage: (context) {
      final int campId = ModalRoute.of(context)?.settings.arguments as int? ?? 1;
      return PaymentPage(campId: campId);
    },

    // Move.campsiteMapPage: (context) => CampsiteMapPage(),
    Move.campsiteCall:(context) => CampsiteCall(),
    Move.reviewPage:(context) {
      final int campId = ModalRoute.of(context)?.settings.arguments as int;
      Logger().d(ModalRoute.of(context)?.settings.arguments as int);
      return ReviewPage(campId: campId);
    }
  };
}
