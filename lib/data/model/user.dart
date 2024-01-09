class User {
  int? id;
  String? username;
  String? password;
  String? nickname;
  String? userImage;
  bool? role;
  bool? isWithdraw;
  String? userCreatedAt;

  User(
      {this.id,
      this.username,
      this.password,
      this.nickname,
      this.userImage,
      this.role,
      this.isWithdraw,
      this.userCreatedAt});

  // 1. Dart 객체를 통신을 위한 Map 형태로 변환
  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "password": password,
        "nickname": nickname,
        "userImage": userImage,
        "role": role,
        "isWithdraw": isWithdraw,
        "userCreatedAt": userCreatedAt,
      };

// 2. Map 형태로 받아서 Dart 객체로 변환
  User.fromJson(Map<String, dynamic> json)
      : id = json["userId"],
        username = json["username"],
        nickname = json["nickname"],
        userImage = json["userImage"],
        role = json["role"],
        isWithdraw = json["isWithdraw"],
        userCreatedAt = json["createdAt"];
}
