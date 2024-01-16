import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/pages/reservation/widget/reservation_range_data_provider.dart';

class DateRangeSelectForm extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reservationData = ref.watch(reservationRangeDataProvider);

    return Container(
      width: double.infinity,
      color: kSubColor,
      child: Padding(
        padding: const EdgeInsets.all(gapMain),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "선택한 날짜",
                  style: subTitle1(),
                ),
                ElevatedButton(
                  onPressed: () => _selectDateRange(context, ref),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                  ),
                  child: Text(
                    '기간 선택하기',
                    style: subTitle2(mColor: kBackWhite),
                  ),
                ),
              ],
            ),
            SizedBox(height: gapLarge),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  reservationData.startDate != null && reservationData.endDate != null
                      ? '${_formatDate(reservationData.startDate!)} - ${_formatDate(reservationData.endDate!)}/(${_calculateDateDifference(reservationData.startDate!, reservationData.endDate!)}박)'
                      : '기간을 선택해주세요',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDateRange(BuildContext context, WidgetRef ref) async {
    DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2024, 1, 1),
      lastDate: DateTime(2030, 12, 31),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: kPrimaryColor,
            hintColor: kPrimaryColor,
            colorScheme: ColorScheme.light(primary: kPrimaryColor),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked.start != null && picked.end != null) {
      final startDate = DateTime(picked.start!.year, picked.start!.month, picked.start!.day);
      final endDate = DateTime(picked.end!.year, picked.end!.month, picked.end!.day);

      ref.read(reservationRangeDataProvider).updateDateRange(startDate, endDate);
    }
  }

  int _calculateDateDifference(DateTime startDate, DateTime endDate) {
    Duration difference = endDate.difference(startDate);
    return difference.inDays;
  }

  String _formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }
}
