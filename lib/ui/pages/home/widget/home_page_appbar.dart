import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSize {
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  const HomePageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: kSubColor,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Image.asset(
                "assets/images/yayoung_logo.png",
                height: 40,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "# 캠핑을 위한 모든 것, 야영에서 함께",
                  style: TextStyle(fontSize: 11),
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(onPressed: () {}, icon: iconSearch()),
        SizedBox(width: gapMedium),
      ],
      elevation: 0,
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
