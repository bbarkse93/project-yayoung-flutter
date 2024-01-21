import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/move.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/pages/my_camping_schedule/my_camping_schedule_view_model.dart';

class PaymentSuccessButton extends ConsumerWidget {
  final int campId;
  const PaymentSuccessButton({
    super.key, required this.campId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.7, // 원하는 비율로 조절
        child: InkWell(
          onTap: () {
            ref.watch(myCampingScheduleProvider.notifier).notifyInit();
            Navigator.pushNamed(
              context,
              Move.myCampingSchedulePage,
            );
          },
          child: Container(
            height: 60,
            decoration: BoxDecoration(
                color: kPrimaryColor, borderRadius: BorderRadius.circular(gapSmall)),
            child: Center(
              child: Text(
                "내 캠핑장",
                style: subTitle1(mColor: kBackWhite),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
