
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

// 로그인 DTO
class LoginReqDTO {
  final String? socialName;


  LoginReqDTO(
      {
         this.socialName,
      });

  Map<String, dynamic> toJson() => {
    "socialName": socialName,
  };
}

class PaymentReqDTO {
  final int campId;
  final DateFormat checkIn;
  final DateFormat checkOut;
  final String fieldName;

  PaymentReqDTO(this.campId, this.checkIn, this.checkOut, this.fieldName);

  Map<String, dynamic> toJson() => {
    "campId": campId,
    "checkIn": checkIn,
    "checkOut": checkOut,
    "fieldName": fieldName,
  };
}

