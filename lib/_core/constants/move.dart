import 'package:flutter/material.dart';
import 'package:team_project/ui/pages/auth/login_page.dart';
import 'package:team_project/ui/pages/campsite/search_campsite_page.dart';
import 'package:team_project/ui/pages/splash/splash_page.dart';

class Move {
  static String loginPage = "/login";
  static String splashPage = "/splash";

  //캠핑장 검색
  static String searchCampsitePage = "/searchCampsite";
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    Move.loginPage: (p0) => const LoginPage(),
    Move.splashPage: (p0) => const SplashPage(),
    Move.searchCampsitePage: (p0) => const SearchCampsitePage(),
  };
}
