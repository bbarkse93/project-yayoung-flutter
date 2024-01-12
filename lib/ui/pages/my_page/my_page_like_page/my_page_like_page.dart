import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/pages/my_page/my_page_like_page/my_page_like_page_widgets/my_page_like_list_page.dart';
import 'package:team_project/ui/widgets/my_page_appbar.dart';

// TODO : 언약 통신시에 List 받아서 뿌리기
class LikePage extends StatelessWidget {
  const LikePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackWhite,
      appBar: MyPageAppbar(
        icon: iconArrowBack(mColor: kBlack,mSize: gapSemiMedium),
        title: "관심 캠핑장",
        button: SizedBox(width: gapMediumLarge),
      ),
      body: LikeListPage(),
    );
  }
}

