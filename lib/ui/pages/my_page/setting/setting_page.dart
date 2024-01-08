import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/ui/pages/my_page/user_update/user_update_page_widgets/user_update_appbar.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserUpdateAppbar(
          icon: iconArrowBack(mColor: kBlack, mSize: 20), title: "설정"
      ),
    );
  }
}
