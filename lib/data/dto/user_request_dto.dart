
import 'package:image_picker/image_picker.dart';

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