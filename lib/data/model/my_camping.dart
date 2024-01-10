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

  factory MyCamping.fromJson(Map<String, dynamic> json) => MyCamping(
    totalRating: json["totalRating"],
    checkInDate: json["checkInDate"],
    checkOutDate: json["checkOutDate"],
    campAddress: json["campAddress"],
    campName: json["campName"],
    reviewImage: json["reviewImage"],
  );

  Map<String, dynamic> toJson() => {
    "totalRating": totalRating,
    "checkInDate": checkInDate,
    "checkOutDate": checkOutDate,
    "campAddress": campAddress,
    "campName": campName,
    "reviewImage": reviewImage,
  };
}

List<MyCamping> myCampingListDTO(dynamic data) {
  List<MyCamping> myCampingListDTO = [];

  for (var myCampDTO in data['response']['myCampDTOs']) {
    MyCamping campingList = MyCamping.fromJson(myCampDTO);
    myCampingListDTO.add(campingList);
  }

  return myCampingListDTO;
}