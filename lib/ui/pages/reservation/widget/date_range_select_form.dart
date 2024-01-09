import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/size.dart';

class DateRangeSelectForm extends StatefulWidget {
  @override
  _DateRangeSelectFormState createState() => _DateRangeSelectFormState();
}

class _DateRangeSelectFormState extends State<DateRangeSelectForm> {
  DateTime? _startDate;
  DateTime? _endDate;

  Future<void> _selectDateRange(BuildContext context) async {
    DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2024, 1, 1),
      lastDate: DateTime(2030, 12, 31),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: kPrimaryColor, // 색상을 원하는 대로 조정
            hintColor: kPrimaryColor, // 색상을 원하는 대로 조정
            colorScheme: ColorScheme.light(primary: kPrimaryColor),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked.start != null && picked.end != null) {
      setState(() {
        _startDate = picked.start;
        _endDate = picked.end;
      });
    }
  }

  String _formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return               Container(
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
                  onPressed: () => _selectDateRange(context),
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
                  _startDate != null && _endDate != null
                      ? '${_formatDate(_startDate!)} - ${_formatDate(
                      _endDate!)}'
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
}
