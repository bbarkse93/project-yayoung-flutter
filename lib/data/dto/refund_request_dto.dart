import 'package:intl/intl.dart';

class RefundReqDTO {
  final int orderId;
  final String campName;
  final String campAddress;
  final DateTime checkInDate;
  final String fieldName;

  RefundReqDTO(
      {required this.orderId,
      required this.campName,
      required this.campAddress,
      required this.checkInDate,
      required this.fieldName});

  Map<String, dynamic> toJson() => {
        "orderId": orderId,
        "campName": campName,
        "campAddress": campAddress,
        "checkInDate": DateFormat('yyyy-MM-dd').format(checkInDate).toString(),
        "fieldName": fieldName,
      };
}
