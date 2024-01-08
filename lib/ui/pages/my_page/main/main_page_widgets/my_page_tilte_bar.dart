import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';


class MyPageTitleBar extends StatelessWidget {
  final dynamic icon;
  final String title;
  final String pushName;


  const MyPageTitleBar({
    super.key, required this.icon, required this.title, required this.pushName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: gapMain,vertical: gapXSmall),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                icon,
                SizedBox(width: 25),
                SizedBox(child: Text(title, style: subTitle2()), width: 120),
              ],
            ),
          ),
          IconButton(icon: iconArrowForward(mColor: kFormFieldBackground),
            onPressed: () {Navigator.pushNamed(context, pushName);},)
        ],
      ),
    );
  }
}
