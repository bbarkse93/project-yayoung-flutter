import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/move.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/pages/campsite/search_campsite_page.dart';
import 'package:team_project/ui/pages/home/widget/explain_bar_form.dart';
import 'package:team_project/ui/pages/home/widget/home_carousel_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSubColor,
        title: Row(
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/images/yayoung_logo.png",
                  height: 40,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "# 캠핑을 위한 모든 것, 야영에서 함께",
                    style: TextStyle(fontSize: 11),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                Logger().d("검색페이지로 이동!");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SearchCampsitePage(),
                  ),
                );
              },
              icon: iconSearch()),
          SizedBox(width: gapMedium),
        ],
        elevation: 0,
      ),
      body: Container(
        color: kSubColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: gapMain),
          child: ListView(
            children: [
              Column(
                children: [
                  SizedBox(height: gapLarge),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 70,
                      height: 20,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey, // 버튼의 배경색
                        borderRadius: BorderRadius.circular(20), // 둥근 테두리 설정
                      ),
                      child: Text(
                        'Click',
                        style: TextStyle(
                          color: Colors.white, // 글자의 색상
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: gapMain),
                ],
              ),
              //캐러우셀 들어가야함
              HomeCarouselSlider(),
              SizedBox(height: gapLarge),
              ExplainBarForm(
                symbol: "D-5",
                title: "다가오는 캠핑",
                subTitle: "01/09(화) 대저생태공원 캠핑장",
                pageAddress: Move.myCampingSchedule,
              ),
              SizedBox(height: gapMain),
              ExplainBarForm(
                symbol: "#",
                title: "내 캠핑장",
                subTitle: "내 캠핑장은 어떤게 있을가요?",
                pageAddress: "/my_camping_schedule",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
