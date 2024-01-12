

import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';

class UserUpdateButton extends StatelessWidget {
  final funPageRoute;
  final String buttonText;

  const UserUpdateButton(
      {required this.funPageRoute, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: funPageRoute,
      child: Text(
        buttonText,
        style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
