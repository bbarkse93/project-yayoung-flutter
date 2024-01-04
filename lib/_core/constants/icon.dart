import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';

Icon iconArrowBack({Color mColor = kPrimaryColor, double mSize = 25}) {
  return Icon(Icons.arrow_back_ios, color: mColor, size: mSize);
}

Icon iconArrowForward({Color mColor = kPrimaryColor, double mSize = 25}) {
  return Icon(Icons.arrow_forward_ios, color: mColor, size: mSize);
}

Icon iconWriteMenu({Color mColor = kPrimaryColor, double mSize = 25}) {
  return Icon(Icons.edit_note, color: mColor, size: mSize);
}

Icon iconEmptyStar({Color mColor = kPrimaryColor, double mSize = 25}) {
  return Icon(Icons.star_border_rounded, color: mColor, size: mSize);
}

Icon iconFullStar({Color mColor = kPrimaryColor, double mSize = 25}) {
  return Icon(Icons.star_rounded, color: mColor, size: mSize);
}

Icon iconEmptyHeart({Color mColor = kPrimaryColor, double mSize = 25}) {
  return Icon(Icons.favorite_border_rounded, color: mColor, size: mSize);
}


// TODO : 바텀네비게이션 - 투데이 아이콘 결정하기
Icon iconBottomToday({Color mColor = kPrimaryColor, double mSize = 25}) {
  return Icon(Icons.accessibility, color: mColor, size: mSize);
}