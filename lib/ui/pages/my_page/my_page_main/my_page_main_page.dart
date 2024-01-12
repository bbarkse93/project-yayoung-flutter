import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/move.dart';
import 'package:team_project/ui/pages/my_page/my_page_main/my_page_main_page_widgets/my_page_main_appbar.dart';
import 'package:team_project/ui/pages/my_page/my_page_main/my_page_main_page_widgets/my_page_main_dividing_line.dart';
import 'package:team_project/ui/pages/my_page/my_page_main/my_page_main_page_widgets/my_page_main_profile.dart';
import 'package:team_project/ui/pages/my_page/my_page_main/my_page_main_page_widgets/my_page_main_tilte_bar.dart';



class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackWhite,
      appBar: MyPageMainAppbar(),
      body: Column(
        children: [
          MyPageProfile(), // 프로필
          MyPageDividing(), // 구분선
          MyPageTitleBar(icon: imageMyPageCalender(mHeight: 35, mWidth: 35),
              title: "캠핑 일정",
              pushName: Move.myCampingSchedulePage),
          MyPageTitleBar(icon: imageMyPageFlag(mHeight: 35, mWidth: 35),
              title: "다녀온 캠핑장",
              pushName: Move.myCampingListPage),
          MyPageTitleBar(icon: iconFullHeart(mSize: 35),
              title: "관심 캠핑장",
              pushName: Move.likePage),
          MyPageTitleBar(icon: imageMyPageNotice(mHeight: 35, mWidth: 35),
              title: "공지사항",
              pushName: Move.noticePage),
        ],
      ),
    );
  }
}





