import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/data/model/camp.dart';
import 'package:team_project/data/model/campsite_detail.dart';
import 'package:team_project/ui/pages/campsite/campsite_detail/campsite_detail_page_widgets/campsite_detail_info/campsite_detail_environment.dart';
import 'package:team_project/ui/pages/campsite/campsite_detail/campsite_detail_page_widgets/campsite_detail_info/campsite_detail_exercise_facility.dart';
import 'package:team_project/ui/pages/campsite/campsite_detail/campsite_detail_page_widgets/campsite_detail_info/campsite_detail_have_facility.dart';
import 'package:team_project/ui/pages/campsite/campsite_detail/campsite_detail_page_widgets/campsite_detail_info/campsite_detail_info.dart';
import 'package:team_project/ui/pages/campsite/campsite_detail/campsite_detail_page_widgets/campsite_detail_info/campsite_detail_main_facility.dart';
import 'package:team_project/ui/pages/campsite/campsite_detail/campsite_detail_page_widgets/campsite_detail_info/campsite_detail_program.dart';
import 'package:team_project/ui/pages/campsite/campsite_detail/campsite_detail_page_widgets/campsite_detail_info/campsite_detail_rental.dart';
import 'package:team_project/ui/pages/campsite/campsite_detail/campsite_detail_page_widgets/campsite_detail_info/campsite_detail_sell.dart';
import 'package:team_project/ui/pages/campsite/campsite_detail/campsite_detail_page_widgets/campsite_detail_info/campsite_detail_site.dart';
import 'package:team_project/ui/pages/campsite/campsite_detail/campsite_detail_page_widgets/campsite_detail_info/campsite_detail_type.dart';
import 'package:team_project/ui/pages/campsite/campsite_detail/campsite_detail_view_model.dart';
import 'package:team_project/ui/pages/campsite/campsite_detail/campsite_detail_page_widgets/campsite_detail_review.dart';

class CampsiteDetailCore extends StatelessWidget {
  final CampsiteDetail campInfo;

  const CampsiteDetailCore({required this.campInfo, super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          if (index == 0) {
            return CampsiteDetailReview(campInfo: campInfo);
          }
          return Padding(
            padding: const EdgeInsets.all(gapMain),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: gapMedium),
                  child: Divider(),
                ),
                CampsiteDetailEnvironment(campsiteDetail: campInfo),
                CampsiteDetailType(campsiteDetail: campInfo),
                CampsiteDetailSite(campsiteDetail: campInfo),
                Padding(
                  padding: const EdgeInsets.only(bottom: gapMedium),
                  child: Divider(),
                ),
                CampsiteDetailMainFacility(campsiteDetail: campInfo),
                CampsiteDetailHaveFacility(campsiteDetail: campInfo),
                CampsiteDetailExerciseFacility(campsiteDetail: campInfo),
                CampsiteDetailProgram(campsiteDetail: campInfo),
                CampsiteDetailRental(campsiteDetail: campInfo),
                CampsiteDetailSell(campsiteDetail: campInfo),
                CampsiteDetailInfo(campInfo: campInfo,)
              ],
            ),
          );
        },
        childCount: 2,
      ),
    );
  }
}
