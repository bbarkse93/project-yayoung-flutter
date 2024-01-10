import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/pages/my_camping_schedule/widget/my_schedule_form.dart';

class MyCampingSchedulePageBody extends StatelessWidget {
  const MyCampingSchedulePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: gapMain),
      child: ListView(
        children: [
          Text(
            "다가오는 일정",
            style: subTitle1(),
          ),
          SizedBox(height: gapMain),
          MyScheduleForm(
            startDate: "8월 25일",
            dDay: "D-365",
            campsite: "성동 서울숲 여름캠핑장(임시캠핑장)",
            campsiteAddress: "서울 성동구 성수동1가 365-20",
          ),
        ],
      ),
    );
  }
}
