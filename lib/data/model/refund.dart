class Refund {
  String? campName;
  String? campAddress;
  String? minPrice;
  String? maxPrice;
  bool? isOpen;
  String? campImage;
  String? campFieldImage;
  String? checkInDate;
  String? checkOutDate;
  String? fieldName;
  String? totalPrice;

  Refund(
      {this.campName,
        this.campAddress,
        this.minPrice,
        this.maxPrice,
        this.isOpen,
        this.campImage,
        this.campFieldImage,
        this.checkInDate,
        this.checkOutDate,
        this.fieldName,
        this.totalPrice});

  Refund.fromJson(Map<String, dynamic> json)
      : campName = json["campInfoDTO"]["campName"],
        campAddress = json["campInfoDTO"]["campAddress"],
        minPrice = json["campInfoDTO"]["minPrice"],
        maxPrice = json["campInfoDTO"]["maxPrice"],
        isOpen = json["campInfoDTO"]["isOpen"],
        campImage = json["campInfoDTO"]["campImage"],
        campFieldImage = json["campFieldImage"],
        checkInDate = json["checkInDate"],
        checkOutDate = json["checkOutDate"],
        fieldName = json["fieldName"],
        totalPrice = json["totalPrice"];


  @override
  String toString() {
    return '{campName: $campName, '
        'campAddress: $campAddress, '
        'minPrice: $minPrice, '
        'maxPrice: $maxPrice, '
        'isOpen: $isOpen, '
        'campImage: $campImage, '
        'campFieldImage: $campFieldImage, '
        'checkInDate: $checkInDate, '
        'checkOutDate: $checkOutDate, '
        'fieldName: $fieldName, '
        'campFieldImage: $campFieldImage, '
        'totalPrice: $totalPrice}';
  }
}