import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/move.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/pages/my_camping_schedule/my_camping_schedule_view_model.dart';

class MyScheduleForm extends ConsumerWidget {
  const MyScheduleForm({Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MyCampingScheduleModel? model = ref.watch(myCampingScheduleProvider);
    List<MyCampingScheduleDTO>? campingScheduleList =
        model?.campingScheduleList;
    if (campingScheduleList == null) {
      return Center(child: Text('캠핑 기록이 없어요: $index'));
    }
    if (index < 0 || index >= campingScheduleList.length) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      decoration: BoxDecoration(
          color: kBackLightGray, borderRadius: BorderRadius.circular(gapMain)),
      height: 190,
      child: Padding(
        padding: const EdgeInsets.all(gapMain),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "${campingScheduleList[index].checkInDate}",
                      style: subTitle1(mFontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: gapMain),
                    Text(
                      "${campingScheduleList[index].checkInDDay}",
                      style: subTitle2(
                          mColor: kFontContent, mFontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    _showAlertDialog(context);
                  },
                  icon: iconClose(),
                ),
              ],
            ),
            SizedBox(height: gapMain),
            Text(
              "${campingScheduleList[index].campName}",
              style: subTitle2(),
            ),
            SizedBox(height: gapXSmall),
            Text(
              "${campingScheduleList[index].campAddress}",
              style: subTitle2(mFontWeight: FontWeight.normal),
            ),
            SizedBox(height: gapMain),
            Text(
              "${campingScheduleList[index].campField}",
              style: subTitle3(),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showAlertDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: kBackWhite,
          title: Center(
            child: Column(
              children: [
                SizedBox(height: gapMain),
                Text(
                  '예약을 취소 하시겠습니까?',
                  style: subTitle1(mColor: kFontRed),
                ),
              ],
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    '아니요',
                    style: subTitle1(mColor: kFontContent),
                  ),
                ),
                Container(
                  color: kFontContent,
                  height: gapLarge,
                  width: 1,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Move.refundPage);
                  },
                  child: Text(
                    '예약 취소',
                    style: subTitle1(
                        mColor: kFontRed, mFontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
