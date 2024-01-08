import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/move.dart';
import 'package:team_project/_core/constants/size.dart';

class ReservationPageAppBar extends StatelessWidget implements PreferredSize {
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  const ReservationPageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: iconArrowBack()),
      title: Text(
        '캠핑날짜',
        style: subTitle1(),
      ),
      centerTitle: true,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, Move.paymentPage);
          },
          child: Text(
            "다음",
            style: subTitle1(),
          ),
        ),
      ],
    );
  }
  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
