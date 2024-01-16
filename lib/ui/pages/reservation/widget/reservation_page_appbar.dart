import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/move.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/pages/payment/payment_view_model.dart';
import 'package:team_project/ui/pages/reservation/reservation_view_model.dart';
import 'package:team_project/ui/pages/reservation/widget/reservation_range_data_provider.dart';

class ReservationPageAppBar extends ConsumerWidget {
  final int campId;

  ReservationPageAppBar({required this.campId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 데이터를 리스너로 등록하지 않고 한 번만 가져오도록 수정
    final reservationData = ref.read(reservationDataProvider);

    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: iconArrowBack(),
      ),
      title: Text(
        '캠핑날짜',
        style: subTitle1(),
      ),
      centerTitle: true,
      actions: [
        TextButton(
          onPressed: () {
            final reservationModel = ref.watch(reservationProvider(campId));
            final reservationRangeData = ref.read(reservationRangeDataProvider);

            // Check if date range is selected
            if (reservationRangeData.startDate == null || reservationRangeData.endDate == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('방문예정일을 선택해주세요.'),
                ),
              );
            } else if (reservationModel?.selectedCampFields?.isEmpty ?? true) {
              // Check if camp field is selected
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('장소를 선택해주세요.'),
                ),
              );
            } else {
              // Update ReservationData with selected data
              final selectedCampField = reservationModel!.selectedCampFields!.first;
              final totalAmount = (double.tryParse(selectedCampField.price?.replaceAll(',', '') ?? '0') ?? 0) * reservationRangeData.nights;
              reservationData.updateData(
                startDate: reservationRangeData.startDate,
                endDate: reservationRangeData.endDate,
                nights: reservationRangeData.nights,
                campField: selectedCampField.fieldName,
                totalAmount: totalAmount.toInt().toString(),  // totalAmount를 정수로 변환한 후 String으로 변환
              );

              // Navigate to the next page
              Navigator.pushNamed(context, Move.paymentPage);
            }
          },
          child: Text(
            "다음",
            style: subTitle1(),
          ),
        ),
      ],
    );
  }

  // 예시: 선택한 필드의 총 가격을 계산하는 함수
  String calculateTotalAmount(List<CampFieldDTO> selectedCampFields) {
    double totalAmount = 0.0;
    for (var field in selectedCampFields) {
      totalAmount += double.tryParse(field.price?.replaceAll(',', '') ?? '0') ?? 0;
    }
    return totalAmount.toStringAsFixed(2);
  }
}
