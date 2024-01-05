import 'package:team_project/_core/constants/icon.dart';

class NavigationItem {
  final int id;
  final dynamic icon;
  final dynamic imgUrl;

  NavigationItem(
      {required this.id,
        required this.icon,
        required this.imgUrl});
}

List<NavigationItem> navigationItem = [
  NavigationItem(
      id: 0,
      icon: imageBottomBarHome(mWidth: 25, mHeight: 25),
      imgUrl: imageBottomBarHomeActive(mWidth: 25, mHeight: 25)),
  NavigationItem(
      id: 1,
      icon: imageBottomBarCamping(mWidth: 35, mHeight: 35),
      imgUrl: imageBottomBarCampingActive(mWidth: 35, mHeight: 35)),
  NavigationItem(
      id: 2,
      icon: imageBottomBarUser(mWidth: 25, mHeight: 25),
      imgUrl: imageBottomBarUserActive(mWidth: 25, mHeight: 25)),

];