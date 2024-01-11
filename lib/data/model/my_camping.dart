class MyCamping {
  final String totalRating;
  final String checkInDate;
  final String checkOutDate;
  final String campAddress;
  final String campName;
  final String reviewImage;

  MyCamping({
    required this.totalRating,
    required this.checkInDate,
    required this.checkOutDate,
    required this.campAddress,
    required this.campName,
    required this.reviewImage,
  });

  // JSON에서 MyCamping으로 변환
  factory MyCamping.fromJson(Map<String, dynamic> json) {
    return MyCamping(
      totalRating: json['totalRating'],
      checkInDate: json['checkInDate'],
      checkOutDate: json['checkOutDate'],
      campAddress: json['campAddress'],
      campName: json['campName'],
      reviewImage: json['reviewImage'],
    );
  }
}