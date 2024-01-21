class Banner {
  int? id;
  String? bannerImage;

  Banner({this.id, this.bannerImage});

  // 1. Dart 객체를 통신을 위한 Map 형태로 변환
  Map<String, dynamic> toJson() =>
      {
        "bannerId": id,
        "bannerImage": bannerImage,
      };

// 2. Map 형태로 받아서 Dart 객체로 변환
  Banner.fromJson(Map<String, dynamic> json)
      : id = json["bannerId"],
        bannerImage = json["bannerImage"];

  @override
  String toString() {
    return 'Banner{id: $id, bannerImage: $bannerImage}';
  }
}
