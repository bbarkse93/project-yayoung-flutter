import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/move.dart';
import 'package:team_project/_core/constants/size.dart';

// AppBar크기
class MyPageMainAppbar extends StatelessWidget implements PreferredSizeWidget  {

  const MyPageMainAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: kBackWhite,
      elevation: 0.0,
      title: Row(
        children: [
          Text('Me', style: TextStyle(fontSize: fontXxlarge, fontWeight: FontWeight.bold)),
        ],
      ) ,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: InkWell(
              onTap: () {
               Navigator.pushNamed(context, Move.settingPage);
              },
                child: imageMyPageSetting()),
          ),
        )
      ],

    );
  }

  // 앱바의 필요한 높이 등의 크기 정보 제공
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
