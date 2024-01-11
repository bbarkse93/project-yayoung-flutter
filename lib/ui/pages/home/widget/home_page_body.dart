import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/move.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/pages/home/widget/home_page_click_button.dart';
import 'package:team_project/ui/pages/my_camping_schedule/my_camping_schedule_view_model.dart';

import 'explain_bar_form.dart';
import 'home_carousel_slider.dart';

class HomePageBody extends ConsumerWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 홈 화면에 처음 접근할 때 데이터 로드
    ref.read(myCampingScheduleProvider.notifier).notifyInit();

    // MyCampingScheduleViewModel을 통해 데이터 가져오기
    final myCampingScheduleModel = ref.watch(myCampingScheduleProvider);

    // 0번지의 데이터 가져오기
    final campingDataAtIndex0 =
        myCampingScheduleModel?.campingScheduleList?.isNotEmpty == true
            ? myCampingScheduleModel!.campingScheduleList![0]
            : null;

    return Container(
      color: kSubColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: gapMain),
        child: ListView(
          children: [
            HomepageClickButton(),
            HomeCarouselSlider(),
            SizedBox(height: gapLarge),
            if (campingDataAtIndex0 != null) ...[
              ExplainBarForm(
                symbol: campingDataAtIndex0.checkInDDay ?? '',
                title: "다가오는 캠핑",
                subTitle:
                    "${campingDataAtIndex0.checkInDate} ${campingDataAtIndex0.campField ?? '알 수 없는 캠핑장'}",
                pageAddress: Move.myCampingSchedulePage,
              ),
            ] else ...[
              ExplainBarForm(
                  symbol: "#",
                  title: "다가오는 캠핑이 없습니다",
                  subTitle: "캠핑을 예약해보세요",
                  pageAddress: Move.myCampingSchedulePage), // 필요에 따라 메시지를 조절하세요
            ],
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
