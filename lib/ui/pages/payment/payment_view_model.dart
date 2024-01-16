import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReservationData extends ChangeNotifier {
  DateTime? startDate;
  DateTime? endDate;
  int nights;
  String campField;
  String totalAmount;

  ReservationData({
    this.startDate,
    this.endDate,
    this.nights = 1,
    this.campField = '',
    this.totalAmount = '',
  });

  // 새로운 방문 예정일을 업데이트하는 메서드
  void updateVisitDate(DateTime startDate, DateTime endDate, int nights) {
    this.startDate = startDate;
    this.endDate = endDate;
    this.nights = nights;
    notifyListeners(); // 변경을 감지한 리스너에게 알림
  }

  // 데이터 업데이트 메서드 추가
  void updateData({
    DateTime? startDate,
    DateTime? endDate,
    int nights = 1,
    String campField = '',
    String totalAmount = '',
  }) {
    this.startDate = startDate;
    this.endDate = endDate;
    this.nights = nights;
    this.campField = campField;
    this.totalAmount = totalAmount;

    // 데이터 변경을 알립니다.
    notifyListeners();
  }
}

final reservationDataProvider = ChangeNotifierProvider((ref) {
  return ReservationData();
});
