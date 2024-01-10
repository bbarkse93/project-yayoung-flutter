import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/pages/my_page/user_update/user_update_page_widgets/user_text_form_field.dart';
import 'package:team_project/ui/widgets/my_page_appbar.dart';
import 'package:team_project/ui/pages/my_page/user_update/user_update_page_widgets/user_update_image.dart';
import 'package:team_project/ui/pages/my_page/user_update/user_update_page_widgets/user_update_sign.dart';

class UserUpdate extends StatelessWidget {
  const UserUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackWhite,
      appBar: MyPageAppbar(icon: iconArrowBack(mColor: kBlack, mSize: gapSemiMedium), title: "프로필", button: Text("확인", style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold))),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(height: gapMediumLarge),
              UserUpdateSign(),
              UserUpdateImage(),
              UserTextFormField(),
            ],
          ),
        ],
      ),
    );
  }
}




