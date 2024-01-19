
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



