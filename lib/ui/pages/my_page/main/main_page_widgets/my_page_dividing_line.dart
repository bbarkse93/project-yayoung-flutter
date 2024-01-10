import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/widgets/my_divider.dart';

class MyPageDividing extends StatelessWidget {
  const MyPageDividing({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(gapMain),
      child: MyDivider(height: 10, thickness: 2, color: kPrimaryColor),
    );
  }
}
