import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/pages/reservation/reservation_view_model.dart';

class CampsiteInfoForm extends ConsumerWidget {
  const CampsiteInfoForm({
    Key? key,
    required this.campId,
  }) : super(key: key);

  final int campId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Logger().d("캠프 ID 잘 전달됨? ${campId}");
    final reservationModel = ref.watch(reservationProvider(campId));
    Logger().d("reservationModel = ${reservationModel?.reservation.toString()}");
    Logger().d("campImage = ${reservationModel?.reservation.campImage}");
    if (reservationModel == null || reservationModel.reservation == null) {
      // 로딩이나 에러에 대한 적절한 UI를 표시
      return Center(child: CircularProgressIndicator());
    }

    print("호출되나요?");
    final reservation = reservationModel.reservation;
    Logger().d("${reservation.campImage}");

    return ProviderScope(
      child: Stack(
        children: [
          Container(
            height: 230,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('${dio.options.baseUrl}${reservation.campImage}'),
              ),
            ),
          ),
          Container(
            height: 230,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4), // 어두운 배경색
            ),
            child: Padding(
              padding: const EdgeInsets.all(gapMain),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "${reservation.campName}",
                    style: title1(mColor: kBackWhite),
                  ),
                  SizedBox(height: gapXSmall),
                  Text(
                    "${reservation.campAddress}",
                    style: subTitle1(mColor: kBackWhite, mFontWeight: FontWeight.normal),
                  ),
                  SizedBox(height: gapXSmall),
                  Text(
                    "${reservation.minPrice} ~ ${reservation.maxPrice}",
                    style: subTitle1(mColor: kBackWhite, mFontWeight: FontWeight.normal),
                  ),
                  SizedBox(height: gapXSmall),
                  Text(
                    reservation.isOpen == true ? "영업중" : (reservation.isOpen == false ? "영업종료" : "알 수 없음"),
                    style: subTitle1(mColor: kBackWhite),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }
}
