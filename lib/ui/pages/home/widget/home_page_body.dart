import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/move.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/pages/home/widget/home_page_click_button.dart';

import '../../../../_core/constants/color.dart';
import 'explain_bar_form.dart';
import 'home_carousel_slider.dart';

class HomePageBody extends StatelessWidget{
  const HomePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kSubColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: gapMain),
        child: ListView(
          children: [
            HomepageClickButton(),
            HomeCarouselSlider(),
            SizedBox(height: gapLarge),
            ExplainBarForm(
              symbol: "D-5",
              title: "다가오는 캠핑",
              subTitle: "01/09(화) 대저생태공원 캠핑장",
              pageAddress: Move.myCampingSchedulePage,
            ),
            SizedBox(height: gapMain),
            ExplainBarForm(
              symbol: "#",
              title: "내 캠핑장",
              subTitle: "내 캠핑장은 어떤게 있을가요?",
              pageAddress: Move.myCampingListPage,
            ),
          ],
        ),
      ),
    );
  }
}

