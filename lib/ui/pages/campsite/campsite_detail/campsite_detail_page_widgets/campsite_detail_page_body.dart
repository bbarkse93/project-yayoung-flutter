import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/data/model/camp.dart';
import 'package:team_project/data/model/campsite_detail.dart';
import 'package:team_project/ui/pages/campsite/campsite_detail/campsite_detail_view_model.dart';
import 'package:team_project/ui/pages/campsite/campsite_detail/campsite_detail_page_widgets/campsite_detail_core.dart';
import 'package:team_project/ui/pages/campsite/campsite_detail/campsite_detail_page_widgets/campsite_detail_header.dart';
import 'package:team_project/ui/pages/campsite/campsite_detail/campsite_detail_page_widgets/campsite_detail_review.dart';

class CampsiteDetailPageBody extends ConsumerWidget {
  final int campId;
  const CampsiteDetailPageBody(this.campId, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CampDetailModel? model = ref.watch(campsiteDetailProvider(campId));
    CampsiteDetail campInfo;
    if (model == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    campInfo = model.campInfo;

    return CustomScrollView(
        slivers: [
          CampsiteDetailHeader(campInfo: campInfo),
          CampsiteDetailCore(campInfo: campInfo),
        ],
      );
  }
}
