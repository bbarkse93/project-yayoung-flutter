import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/pages/my_camping_schedule/my_camping_schedule_view_model.dart';
import 'package:team_project/ui/pages/my_camping_schedule/widget/my_schedule_form.dart';

class MyCampingSchedulePageBody extends ConsumerWidget {
  const MyCampingSchedulePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 데이터 로딩 여부를 확인할 수 있는 로직 추가
    final myCampingScheduleModel = ref.watch(myCampingScheduleProvider);

    if (myCampingScheduleModel == null) {
      // 데이터 로딩 중이라면 로딩 화면을 보여줄 수 있습니다.
      return CircularProgressIndicator();
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: gapMain),
      child:
      myCampingScheduleModel.campingScheduleList.isNotEmpty
      ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: gapMain),
          Text(
            "다가오는 일정",
            style: subTitle1(),
          ),
          SizedBox(height: gapMain),
          Expanded(
            child:
            ListView.builder(
              itemCount: myCampingScheduleModel.campingScheduleList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    MyScheduleForm(
                        index: index,
                        campId: myCampingScheduleModel
                            .campingScheduleList[index].campId,
                        orderId: myCampingScheduleModel
                            .campingScheduleList[index].orderId),
                    SizedBox(height: gapLarge),
                  ],
                );
              },
            )
          ),
        ],
      )
      // 리스트가 공백이면
      : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              height: getScreenHeight(context) * 1.0,
              width: getScreenWidth(context) * 1.0,
              child: imageMyCampingSchedulePage(),
            ),
          ),
        ],
      ),
    );
  }
}
