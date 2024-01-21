import 'package:intl/intl.dart';

String formatDateString(String originalDateString) {
  // DateTime 형식으로 변환
  DateTime originalDate = DateTime.parse(originalDateString);

  // "YY/MM/DD" 형식으로 날짜를 변환
  String formattedDate = DateFormat('yyyy/MM/dd').format(originalDate);

  return formattedDate;
}

String formatNumber(int number) {
  NumberFormat formatter = NumberFormat('#,###');
  String formattedNumber = formatter.format(number);
  return formattedNumber;
}