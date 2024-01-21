import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/pages/reservation/reservation_page_widgets/reservation_range_data_provider.dart';
import 'package:team_project/ui/pages/reservation/reservation_view_model.dart';

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

        final price =
            double.tryParse(campFieldDTO?.price?.replaceAll(',', '') ?? '0') ??
                0;
        final nights = reservationRangeData.nights; // 직접 ref.watch 호출

        final totalAmount = (price * nights).toStringAsFixed(0);

        bool isChecked =
            reservationModel.selectedCampFields.contains(campFieldDTO);

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Text(
                    "${campFieldDTO?.fieldName}",
                    style: subTitle2(),
                  ),
                  SizedBox(width: gapXLarge),
                  Text(
                    "${totalAmount.toString()}원/$nights박",
                    style: subTitle2(),
                  ),
                ],
              ),
            ),
            Checkbox(
              value: isChecked,
              onChanged: (bool? isChecked) {
                if (isChecked != null) {
                  ref
                      .read(reservationProvider(campId).notifier)
                      .toggleCampField(campFieldDTO!);
                }
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
