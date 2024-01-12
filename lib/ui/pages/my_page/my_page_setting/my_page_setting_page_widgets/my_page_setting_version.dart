import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/move.dart';
import 'package:team_project/_core/constants/size.dart';

class SettingVersion extends StatelessWidget {
final String version;

  const SettingVersion({super.key, required this.version});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: gapMain,right: gapMain, bottom: gapMain, top: gapMedium),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("버전정보", style: subTitle2(mFontWeight: FontWeight.w900),),
          Text(version, style: subTitle2(mFontWeight: FontWeight.w700), textAlign: TextAlign.center,)
        ],
      ),
    );
  }



}
