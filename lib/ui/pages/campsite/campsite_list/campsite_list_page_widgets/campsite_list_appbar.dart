import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';

class CampsiteListAppbar extends StatelessWidget implements PreferredSize {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget get child => throw UnimplementedError();

  const CampsiteListAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text("캠핑장", style: TextStyle(fontSize: fontSemiLarge, fontWeight: FontWeight.bold)),
      actions: [
        Padding(
          padding: const EdgeInsets.all(gapMain),
          child: iconSearch(),
        )
      ],
    );
  }
}
