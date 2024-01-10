import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';

/// 마진 및 간격의 크기
const double gapMain = 16.0; // 기본 화면 padding

const double gapXSmall = 5.0;
const double gapSmall = 10.0;
const double gapMedium = 15.0;
const double gapSemiMedium = 20.0;
const double gapMediumLarge = 25.0;
const double gapLarge = 30.0;
const double gapSemiLarge = 35.0;
const double gapXLarge = 40.0;
const double gapXxLarge = 50.0;


/// 글씨 크기
const double fontXSmall = 10.0;
const double fontSmall = 12.0;
const double fontMedium = 14.0;
const double fontSemiMedium = 16.0;
const double fontLarge = 18.0;
const double fontSemiLarge = 20.0;
const double fontXlarge = 24.0;
const double fontXxlarge = 26.0;

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
    {Color mColor = kFontTitle, FontWeight mFontWeight = FontWeight.bold}) {
  return TextStyle(
      fontSize: 24, fontWeight: mFontWeight, color: mColor, height: 1.4);
}

TextStyle title2(
    {Color mColor = kFontTitle, FontWeight mFontWeight = FontWeight.bold}) {
  return TextStyle(
      fontSize: 22, fontWeight: mFontWeight, color: mColor, height: 1.4);
}

TextStyle title3(
    {Color mColor = kFontTitle, FontWeight mFontWeight = FontWeight.bold}) {
  return TextStyle(
      fontSize: 20, fontWeight: mFontWeight, color: mColor, height: 1.4);
}

/// 서브 타이틀 폰트 = subtitle
TextStyle subTitle1(
    {Color mColor = kFontTitle, FontWeight mFontWeight = FontWeight.bold}) {
  return TextStyle(
      fontSize: 18, fontWeight: mFontWeight, color: mColor, height: 1.4);
}

TextStyle subTitle2(
    {Color mColor = kFontTitle, FontWeight mFontWeight = FontWeight.bold}) {
  return TextStyle(
      fontSize: 16, fontWeight: mFontWeight, color: mColor, height: 1.4);
}

TextStyle subTitle3(
    {Color mColor = kFontTitle, FontWeight mFontWeight = FontWeight.bold}) {
  return TextStyle(
      fontSize: 14, fontWeight: mFontWeight, color: mColor, height: 1.4);
}

/// 본문 폰트 = body
TextStyle bodyBlack1(
    {Color mColor = kFontTitle, FontWeight mFontWeight = FontWeight.normal}) {
  return TextStyle(
      fontSize: 14, fontWeight: mFontWeight, color: mColor, height: 1.4);
}

TextStyle bodyBlack2(
    {Color mColor = kFontTitle, FontWeight mFontWeight = FontWeight.normal}) {
  return TextStyle(
      fontSize: 12, fontWeight: mFontWeight, color: mColor, height: 1.4);
}

TextStyle bodyBlack3(
    {Color mColor = kFontTitle, FontWeight mFontWeight = FontWeight.normal}) {
  return TextStyle(
      fontSize: 10, fontWeight: mFontWeight, color: mColor, height: 1.4);
}

TextStyle bodyGray1(
    {Color mColor = kFontContent, FontWeight mFontWeight = FontWeight.normal}) {
  return TextStyle(
      fontSize: 14, fontWeight: mFontWeight, color: mColor, height: 1.4);
}

TextStyle bodyGray2(
    {Color mColor = kFontContent, FontWeight mFontWeight = FontWeight.normal}) {
  return TextStyle(
      fontSize: 12, fontWeight: mFontWeight, color: mColor, height: 1.4);
}

TextStyle bodyGray3(
    {Color mColor = kFontContent, FontWeight mFontWeight = FontWeight.normal}) {
  return TextStyle(
      fontSize: 10, fontWeight: mFontWeight, color: mColor, height: 1.4);
}

TextStyle bodyLightGray1(
    {Color mColor = kFontGray, FontWeight mFontWeight = FontWeight.normal}) {
  return TextStyle(
      fontSize: 14, fontWeight: mFontWeight, color: mColor, height: 1.4);
}

TextStyle bodyLightGray2(
    {Color mColor = kFontGray, FontWeight mFontWeight = FontWeight.normal}) {
  return TextStyle(
      fontSize: 12, fontWeight: mFontWeight, color: mColor, height: 1.4);
}

TextStyle bodyLightGray3(
    {Color mColor = kFontGray, FontWeight mFontWeight = FontWeight.normal}) {
  return TextStyle(
      fontSize: 10, fontWeight: mFontWeight, color: mColor, height: 1.4);
}

TextStyle bodyBlue1(
    {Color mColor = kFontBlue, FontWeight mFontWeight = FontWeight.normal}) {
  return TextStyle(
      fontSize: 14, fontWeight: mFontWeight, color: mColor, height: 1.4);
}

TextStyle bodyBlue2(
    {Color mColor = kFontBlue, FontWeight mFontWeight = FontWeight.normal}) {
  return TextStyle(
      fontSize: 12, fontWeight: mFontWeight, color: mColor, height: 1.4);
}

TextStyle bodyBlue3(
    {Color mColor = kFontBlue, FontWeight mFontWeight = FontWeight.normal}) {
  return TextStyle(
      fontSize: 10, fontWeight: mFontWeight, color: mColor, height: 1.4);
}

TextStyle bodyRed1(
    {Color mColor = kFontRed, FontWeight mFontWeight = FontWeight.normal}) {
  return TextStyle(
      fontSize: 14, fontWeight: mFontWeight, color: mColor, height: 1.4);
}

TextStyle bodyRed2(
    {Color mColor = kFontRed, FontWeight mFontWeight = FontWeight.normal}) {
  return TextStyle(
      fontSize: 12, fontWeight: mFontWeight, color: mColor, height: 1.4);
}

TextStyle bodyRed3(
    {Color mColor = kFontRed, FontWeight mFontWeight = FontWeight.normal}) {
  return TextStyle(
      fontSize: 10, fontWeight: mFontWeight, color: mColor, height: 1.4);
}
