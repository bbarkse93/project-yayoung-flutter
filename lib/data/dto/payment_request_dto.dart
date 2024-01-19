import 'package:intl/intl.dart';

class PaymentReqDTO {
  final int campId;
  final DateTime checkIn;
  final DateTime checkOut;
  final String fieldName;
  final int totalPrice;
  final String orderNumber;

  PaymentReqDTO({
    required this.campId,
    required this.checkIn,
    required this.checkOut,
    required this.fieldName,
    required this.totalPrice,
    required this.orderNumber,
  });

  // copyWith 메서드 추가
  PaymentReqDTO copyWith({
    int? campId,
    DateTime? checkIn,
    DateTime? checkOut,
    String? fieldName,
    int? totalPrice,
    String? orderNumber,
  }) {
    return PaymentReqDTO(
      campId: campId ?? this.campId,
      checkIn: checkIn ?? this.checkIn,
      checkOut: checkOut ?? this.checkOut,
      fieldName: fieldName ?? this.fieldName,
      totalPrice: totalPrice ?? this.totalPrice,
      orderNumber: orderNumber ?? this.orderNumber,
    );
  }

  // toJson 메서드 추가
  Map<String, dynamic> toJson() => {
    "campId": campId,
    "checkIn": DateFormat('yyyy-MM-dd').format(checkIn).toString(),
    "checkOut": DateFormat('yyyy-MM-dd').format(checkOut).toString(),
    "fieldName": fieldName,
    "totalPrice": totalPrice,
    "orderNumber": orderNumber,
  };
}
