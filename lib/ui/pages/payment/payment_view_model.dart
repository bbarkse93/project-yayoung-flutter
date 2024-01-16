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
}

final reservationDataProvider = ChangeNotifierProvider((ref) {
  return ReservationData();
});
