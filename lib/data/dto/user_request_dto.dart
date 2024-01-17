
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class UserUpdateReqDTO {
  final String nickname;
  final String userImage;


  UserUpdateReqDTO(
      {required this.nickname, required this.userImage});

  Map<String, dynamic> toJson() => {
    "nickname": nickname,
    "userImage": userImage,
  };
}

class PaymentReqDTO {
  final int campId;
  final DateTime checkIn;
  final DateTime checkOut;
  final String fieldName;
  // final int totalPrice;

  PaymentReqDTO({
    required this.campId,
    required this.checkIn,
    required this.checkOut,
    required this.fieldName,
    // required this.totalPrice,
  });

  Map<String, dynamic> toJson() => {
    "campId": campId,
    "checkIn": DateFormat('yyyy-MM-dd').format(checkIn).toString(),
    "checkOut": DateFormat('yyyy-MM-dd').format(checkOut).toString(),
    "fieldName": fieldName,
    // "totalPrice": totalPrice,
  };
}