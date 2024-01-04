import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';

import 'widget/my_schedule_form.dart';

class MyCampingSchedule extends StatelessWidget {
  const MyCampingSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackWhite,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: iconArrowBack()),
        title: Text(
          "캠핑 일정",
          style: title1(),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: gapMain),
        child: ListView(
          children: [
            Text(
              "다가오는 일정",
              style: subTitle1(),
            ),
            SizedBox(height: gapMain),
            MyScheduleForm(
              date: "8월 25일",
              dDay: "D-365",
              campsite: "성동 서울숲 여름캠핑장(임시캠핑장)",
              campsiteAddress: "서울 성동구 성수동1가 365-20",
              weather: "날씨정보 들어가야함!",
            ),
          ],
        ),
      ),
    );
  }
}
