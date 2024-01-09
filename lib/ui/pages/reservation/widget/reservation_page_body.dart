import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/data/mock/campsite_area.dart';
import 'package:team_project/ui/pages/refund/widget/campsite_info_form.dart';
import 'package:team_project/ui/pages/reservation/widget/campsite_area_map.dart';
import 'package:team_project/ui/pages/reservation/widget/date_range_select_form.dart';
import 'package:team_project/ui/pages/reservation/widget/reservation_option_form.dart';

class ReservationPageBody extends StatefulWidget {
  @override
  _ReservationPageBodyState createState() => _ReservationPageBodyState();
}

class _ReservationPageBodyState extends State<ReservationPageBody> {
  List<bool> isCheckedList = List.filled(CampsiteAreaList.length, false);

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CampsiteInfoForm(
            campsiteImage: "assets/images/tent1.png",
            campsite: "물가솔솔캠핑장",
            campsiteAddress: "강원도 홍천 내면 광원리 471-4",
            campsitePriceMin: 45000,
            campsitePriceMax: 55000,
            run: "운영중"),
        SizedBox(height: gapMain),
        Padding(
          padding: const EdgeInsets.all(gapMain),
          child: Column(
            children: [
              CampsiteAreaMap(),
              SizedBox(height: gapMain),
              DateRangeSelectForm(),
              SizedBox(height: gapXLarge),
              // 여러 개의 예약 옵션 폼 생성
              for (int i = 0; i < CampsiteAreaList.length; i++)
                ReservationOptionForm(
                  isChecked: isCheckedList[i],
                  area: CampsiteAreaList[i].area,
                  reservationPrice: CampsiteAreaList[i].reservationPrice,
                  countDay: CampsiteAreaList[i].countDay,
                  onChanged: (bool? value) {
                    // Handle checkbox state change
                    setState(() {
                      isCheckedList[i] = value ?? false;
                    });
                  },
                ),
            ],
          ),
        ),
      ],
    );
  }
}
