import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/data/mock/campsite_area.dart';
import 'package:team_project/ui/pages/refund/widget/campsite_info_form.dart';
import 'package:team_project/ui/pages/reservation/widget/campsite_area_map.dart';
import 'package:team_project/ui/pages/reservation/widget/date_range_select_form.dart';
import 'package:team_project/ui/pages/reservation/widget/reservation_option_form.dart';

class ReservationPageBody extends StatefulWidget {

  final int campId;

  ReservationPageBody({required this.campId});

  @override
  _ReservationPageBodyState createState() => _ReservationPageBodyState();
}

class _ReservationPageBodyState extends State<ReservationPageBody> {
  List<bool> isCheckedList = List.filled(CampsiteAreaList.length, false);

  bool isChecked = false;

  // campListProvider

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CampsiteInfoForm(campId: widget.campId),
        SizedBox(height: gapMain),
        Padding(
          padding: const EdgeInsets.all(gapMain),
          child: Column(
            children: [
              CampsiteAreaMap(campId: widget.campId),
              SizedBox(height: gapMain),
              DateRangeSelectForm(),
              SizedBox(height: gapXLarge),
              // 여러 개의 예약 옵션 폼 생성
              ReservationOptionForm(campId: widget.campId),
            ],
          ),
        ),
      ],
    );
  }
}
