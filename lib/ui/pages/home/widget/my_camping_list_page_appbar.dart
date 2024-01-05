import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';

import '../../../../_core/constants/color.dart';

class MyCampingListPageAppBar extends StatelessWidget implements PreferredSize  {
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  const MyCampingListPageAppBar({
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
          icon: iconArrowBack()),
      title: Text(
        "내 캠핑장",
        style: title1(),
      ),
      elevation: 0,
    );
  }
  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
