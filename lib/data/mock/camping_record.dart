class CampingRecord {
  final String campingImage;
  final String campsite;
  final String campsiteAddress;
  final String startDate;
  final String endDate;
  final String rating;

  CampingRecord({
    required this.campingImage,
    required this.campsite,
    required this.campsiteAddress,
    required this.startDate,
    required this.endDate,
    required this.rating,
  });
}

List<CampingRecord> CampingRecordList = [
  CampingRecord(
    campingImage: 'assets/images/fire1.png',
    campsite: '서울 서초 글램핑 청계',
    campsiteAddress: '서울 서초구 원자동 207-1',
    startDate: '2023-08-23',
    endDate: '2023-08-24',
    rating: '4',
  ),
  CampingRecord(
    campingImage: 'assets/images/fire2.png',
    campsite: '인천 좋은 캠핑',
    campsiteAddress: '인천 주소입니다',
    startDate: '2023-07-03',
    endDate: '2023-07-06',
    rating: '5',
  ),
  CampingRecord(
    campingImage: 'assets/images/tent1.png',
    campsite: '부산 해변바람',
    campsiteAddress: '부산시 기장군',
    startDate: '2023-06-11',
    endDate: '2023-06-11',
    rating: '4',
  ),
  CampingRecord(
    campingImage: 'assets/images/tent3.png',
    campsite: '강원 푸른솔산장',
    campsiteAddress: '강원도 화천군 사내면 사창리',
    startDate: '2023-03-03',
    endDate: '2023-03-04',
    rating: '3',
  ),
  CampingRecord(
    campingImage: 'assets/images/fire4.png',
    campsite: '광주 나루계곡',
    campsiteAddress: '광주시',
    startDate: '2023-02-15',
    endDate: '2023-02-16',
    rating: '5',
  ),
];
