import 'package:team_project/ui/pages/reservation/reservation_view_model.dart';

class Reservation {
  int? campId;
  String? campName;
  String? campAddress;
  String? minPrice;
  String? maxPrice;
  bool? isOpen;
  String? campImage;
  String? campFieldImage;
  List<CampFieldDTO>? campFieldDTOs;

  Reservation(
      {this.campId,
      this.campName,
      this.campAddress,
      this.minPrice,
      this.maxPrice,
      this.isOpen,
      this.campImage,
      this.campFieldImage,
      this.campFieldDTOs});

  Reservation.fromJson(Map<String, dynamic> json)
      : campId = json["campId"],
        campName = json["campInfoDTO"]["campName"],
        campAddress = json["campInfoDTO"]["campAddress"],
        minPrice = json["campInfoDTO"]["minPrice"],
        maxPrice = json["campInfoDTO"]["maxPrice"],
        isOpen = json["campInfoDTO"]["isOpen"],
        campImage = json["campInfoDTO"]["campImage"],
        campFieldImage = json["campFieldImage"],
        campFieldDTOs = (json["campFieldDTOs"] as List<dynamic>? ?? [])
            .map((o) => CampFieldDTO.fromJson(o))
            .toList();

  @override
  String toString() {
    return '{campId: $campId, '
        'campName: $campName, '
        'campAddress: $campAddress, '
        'minPrice: $minPrice, '
        'maxPrice: $maxPrice, '
        'isOpen: $isOpen, '
        'campImage: $campImage, '
        'campFieldImage: $campFieldImage, '
        'campFieldDTOs: $campFieldDTOs}';
  }
}
