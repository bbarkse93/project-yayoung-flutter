class MyCampingDTO {
  final String totalRating;
  final String checkInDate;
  final String checkOutDate;
  final String campAddress;
  final String campName;
  final String reviewImage;

  MyCampingDTO({
    required this.totalRating,
    required this.checkInDate,
    required this.checkOutDate,
    required this.campAddress,
    required this.campName,
    required this.reviewImage,
  });

  factory MyCampingDTO.fromJson(Map<String, dynamic> json) => MyCampingDTO(
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

List<MyCampingDTO> myCampingListDTO(dynamic data) {
  List<MyCampingDTO> myCampingListDTO = [];

  for (var myCampDTO in data['response']['myCampDTOs']) {
    MyCampingDTO campingList = MyCampingDTO.fromJson(myCampDTO);
    myCampingListDTO.add(campingList);
  }

  return myCampingListDTO;
}
