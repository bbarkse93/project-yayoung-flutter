import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/ui/pages/reservation/reservation_view_model.dart';

class CampsiteAreaMap extends ConsumerWidget {
  const CampsiteAreaMap({
    Key? key,
    required this.campId,
  }) : super(key: key);

  final int campId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reservationModel = ref.watch(reservationProvider(campId));
    if (reservationModel == null || reservationModel.reservation == null) {
      // 로딩이나 에러에 대한 적절한 UI를 표시
      return Center(child: CircularProgressIndicator());
    }
    final reservation = reservationModel.reservation;
    return ProviderScope(
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('${dio.options.baseUrl}${reservation.campFieldImage}'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
