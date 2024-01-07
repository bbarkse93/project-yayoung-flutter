import 'package:flutter/material.dart';

class DateRangeSelectPage extends StatefulWidget {
  final Function(DateTimeRange?) onDateRangeSelected;

  DateRangeSelectPage({Key? key, required this.onDateRangeSelected})
      : super(key: key);

  @override
  _DateRangeSelectPageState createState() =>
      _DateRangeSelectPageState();
}

class _DateRangeSelectPageState extends State<DateRangeSelectPage> {
  DateTimeRange? _selectedDateRange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('날짜 선택'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 화면을 꾸미는 코드 추가
            // 예시로 간단히 ElevatedButton을 두어 날짜를 선택하도록 함
            ElevatedButton(
              onPressed: () {
                // 날짜 선택 로직을 구현하고 선택된 날짜를 전달
                DateTime startDate = DateTime.now();
                DateTime endDate = DateTime.now().add(Duration(days: 7));
                _selectedDateRange = DateTimeRange(start: startDate, end: endDate);

                // 선택된 날짜를 콜백 함수를 통해 전달
                widget.onDateRangeSelected(_selectedDateRange);

                // 페이지를 닫음
                Navigator.pop(context);
              },
              child: Text('날짜 선택 완료'),
            ),
          ],
        ),
      ),
    );
  }
}
