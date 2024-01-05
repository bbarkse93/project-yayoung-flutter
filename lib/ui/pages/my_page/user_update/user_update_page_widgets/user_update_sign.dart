import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/size.dart';

class UserUpdateSign extends StatelessWidget {
  const UserUpdateSign({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        alignment: Alignment.centerLeft,
          child: Text(" 프로필 사진 및 \n 닉네임을 적어주세요",style: title2(),)),
    );
  }
}
