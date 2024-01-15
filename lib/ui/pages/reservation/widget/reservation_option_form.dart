import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/pages/reservation/reservation_view_model.dart';
import 'package:team_project/ui/pages/reservation/widget/reservation_range_data_provider.dart';

class ReservationOptionForm extends ConsumerWidget {
  final int campId;

  ReservationOptionForm({required this.campId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reservationModel = ref.watch(reservationProvider(campId));
    final reservationRangeData = ref.watch(reservationRangeDataProvider);

    if (reservationModel == null || reservationModel.reservation == null) {
      return Center(child: CircularProgressIndicator());
    }
    final reservation = reservationModel.reservation;

    return ListView.builder(
      shrinkWrap: true,
      itemCount: reservation.campFieldDTOs?.length,
      itemBuilder: (context, index) {
        final campFieldDTO = reservation.campFieldDTOs?[index];

        final price = double.tryParse(campFieldDTO?.price?.replaceAll(',', '') ?? '0') ?? 0;
        final nights = reservationRangeData.nights; // 직접 ref.watch 호출

        final totalAmount = (price * nights).toStringAsFixed(0);

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Text(
                    "${campFieldDTO?.fieldName}",
                    style: subTitle3(),
                  ),
                  SizedBox(width: gapXLarge),
                  Text(
                    "$totalAmount원/$nights박",
                    style: subTitle3(),
                  ),
                ],
              ),
            ),
            Checkbox(
              value: reservationModel.selectedCampFields.contains(campFieldDTO),
              onChanged: (isChecked) {
                // 선택 토글 로직을 여기에 작성
              },
              activeColor: kPrimaryColor,
              checkColor: kBackWhite,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ],
        );
      },
    );
  }
}
