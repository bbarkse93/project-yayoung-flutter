import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/move.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/pages/reservation/reservation_view_model.dart';
import 'package:team_project/ui/pages/reservation/widget/reservation_range_data_provider.dart';

class ReservationPageAppBar extends ConsumerWidget {
  final int campId;

  ReservationPageAppBar({required this.campId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            final reservationModel = ref.read(reservationProvider(campId));
            final reservationData = ref.watch(reservationRangeDataProvider);

            // Check if date range is selected
            if (reservationData.startDate == null || reservationData.endDate == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('방문예정일을 선택해주세요.'),
                ),
              );
            } else if (reservationModel?.selectedCampFields.isEmpty ?? true) {
              // Check if camp field is selected
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('장소를 선택해주세요.'),
                ),
              );
            } else {
              // Selected camp field and date range, navigate to the next page
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
}