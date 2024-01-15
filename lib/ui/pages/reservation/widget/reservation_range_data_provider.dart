import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

class ReservationRangeData extends ChangeNotifier {
  DateTime? _startDate;
  DateTime? _endDate;
  int _nights;

  ReservationRangeData({DateTime? startDate, DateTime? endDate, int nights = 1})
      : _startDate = startDate,
        _endDate = endDate,
        _nights = nights;

  DateTime? get startDate => _startDate;
  DateTime? get endDate => _endDate;
  int get nights => _nights;

  void updateDateRange(DateTime? startDate, DateTime? endDate) {
    _startDate = startDate;
    _endDate = endDate;
    _updateNights();
    notifyListeners();
  }

  void _updateNights() {
    if (_startDate != null && _endDate != null) {
      Duration difference = _endDate!.difference(_startDate!);
      _nights = difference.inDays;
    } else {
      _nights = 1; // Set default value to 1
    }
  }

  void updateNights() {
    Logger().d("재빌드 함수 호출?");
    _updateNights();
    notifyListeners(); // 변경 사항을 감지할 수 있도록 notifyListeners 호출

    Logger().d("재빌드 되었습니까?");
  }


}

final reservationRangeDataProvider = ChangeNotifierProvider<ReservationRangeData>((ref) {
  return ReservationRangeData();
});
