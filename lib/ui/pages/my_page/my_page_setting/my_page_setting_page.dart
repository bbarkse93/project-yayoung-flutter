import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/pages/my_page/my_page_setting/my_page_setting_page_widgets/my_page_automatic_login.dart';
import 'package:team_project/ui/pages/my_page/my_page_setting/my_page_setting_page_widgets/my_page_setting_logout.dart';
import 'package:team_project/ui/pages/my_page/my_page_setting/my_page_setting_page_widgets/my_page_setting_version.dart';
import 'package:team_project/ui/pages/my_page/my_page_setting/my_page_setting_page_widgets/my_page_setting_withdrawal.dart';

import 'package:team_project/ui/widgets/my_page_appbar.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackWhite,
      appBar: MyPageAppbar(icon: iconArrowBack(mColor: kBlack,mSize: gapSemiMedium), title: "설정", button: SizedBox(width: gapMediumLarge),),
      body: Column(
        children: [
          AutomaticLogin(),
          SettingLogout(),
          SettingWithdrawal(),
          SettingVersion(version: "1.0.6"),
        ],
      ),
    );
  }

}


