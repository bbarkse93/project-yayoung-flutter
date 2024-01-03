import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';

/// 마진 및 간격의 크기
const double gapMain = 16.0; // 기본 Padding

const double gapXSmall = 5.0;
const double gapSmall = 10.0;
const double gapMedium = 20.0;
const double gapLarge = 30.0;
const double gapXLargeGap = 50.0;

/// 글씨 크기
const double fontXSmall = 10.0;
const double fontSmall = 12.0;
const double fontMedium = 16.0;
const double fontLarge = 20.0;
const double fontXlarge = 26.0;

/// 화면 최대 width
double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

/// 화면 최대 height
double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

/// Drawer width
double getDrawerWidth(BuildContext context) {
  return getScreenWidth(context) * 0.6;
}


/// 타이틀 폰트 = title
TextStyle title1(
    {Color mColor = kFontBlack, FontWeight mFontWeight = FontWeight.bold}) {
  return TextStyle(
      fontSize: 24, fontWeight: mFontWeight, color: mColor, height: 1.4);
}

/// 서브 타이틀 폰트 = subtitle
TextStyle subTitle1(
    {Color mColor = kFontBlack, FontWeight mFontWeight = FontWeight.bold}) {
  return TextStyle(
      fontSize: 18, fontWeight: mFontWeight, color: mColor, height: 1.4);
}

TextStyle subTitle2(
    {Color mColor = kFontBlack, FontWeight mFontWeight = FontWeight.bold}) {
  return TextStyle(
      fontSize: 16, fontWeight: mFontWeight, color: mColor, height: 1.4);
}

TextStyle subTitle3(
    {Color mColor = kFontBlack, FontWeight mFontWeight = FontWeight.bold}) {
  return TextStyle(
      fontSize: 14, fontWeight: mFontWeight, color: mColor, height: 1.4);
}

/// 본문 폰트 = body
TextStyle body1(
    {Color mColor = kFontBlack, FontWeight mFontWeight = FontWeight.bold}) {
  return TextStyle(
      fontSize: 14, fontWeight: mFontWeight, color: mColor, height: 1.4);
}

TextStyle body2(
    {Color mColor = kFontBlack, FontWeight mFontWeight = FontWeight.bold}) {
  return TextStyle(
      fontSize: 12, fontWeight: mFontWeight, color: mColor, height: 1.4);
}

TextStyle body3(
    {Color mColor = kFontBlack, FontWeight mFontWeight = FontWeight.normal}) {
  return TextStyle(
      fontSize: 10, fontWeight: mFontWeight, color: mColor, height: 1.4);
}