import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';

class MyCampingSchedulePageAppBar extends StatelessWidget
    implements PreferredSize {
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  const MyCampingSchedulePageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kBackWhite,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: iconArrowBack(mColor: kBlack,mSize: gapSemiMedium)),
      title: Text(
        "캠핑 일정",
        style: title3(),
      ),
      elevation: 0,
      centerTitle: true,
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
