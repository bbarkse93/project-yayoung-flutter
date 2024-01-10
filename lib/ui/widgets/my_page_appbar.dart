import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/move.dart';
import 'package:team_project/_core/constants/size.dart';

class MyPageAppbar extends StatelessWidget implements PreferredSizeWidget {
  final dynamic icon;
  final String title;
  final dynamic button;

  const MyPageAppbar({
    super.key, this.icon, required this.title, this.button,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0.0,
      leading: IconButton(icon
          : icon, onPressed: () {
        Navigator.pop(context);
      }),
      title: Center(child: Text(title, style: title3())),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(gapMain),
          child: InkWell(
            onTap: (){
              Navigator.pushNamed(context, Move.mainScreenPage);
            },
            child: Container(
              child: button,
            ),
          ),
        )
      ],
    );
  }
  // 앱바의 필요한 높이 등의 크기 정보 제공
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}


