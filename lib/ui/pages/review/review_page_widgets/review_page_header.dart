import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/data/model/campsite_detail.dart';
import 'package:team_project/ui/pages/campsite/campsite_detail/campsite_detail_view_model.dart';
import 'package:team_project/ui/pages/review/review_page_view_model.dart';

class ReviewPageHeader extends ConsumerWidget {
  int? campId;
  ReviewPageHeader({super.key, required this.campId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CampDetailModel? campInfo =
        ref.watch(campsiteDetailProvider(campId ?? 0));
    if (campInfo == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    CampsiteDetail campDetail = campInfo.campInfo;
    return Container(
      width: double.infinity,
      height: getScreenHeight(context) * 0.3,
      decoration: BoxDecoration(color: kSubColor),
      child: Padding(
        padding: const EdgeInsets.all(gapMain),
        child: Column(
          children: [
            Text(
              "${campDetail.campName}",
              style:
                  TextStyle(fontSize: fontLarge, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: campDetail.totalRating == "평가없음" ? gapSemiMedium : 0),
              child: Text(
                "${campDetail.totalRating}",
                style: TextStyle(
                  fontSize: campDetail.totalRating == "평가없음" ? gapSemiMedium : fontMax,
                ),
              ),
            ),
            SizedBox(
              height: gapSmall,
            ),
            Text("세부항목"),
            SizedBox(
              height: gapSmall,
            ),
            Container(
              width: getScreenWidth(context) * 0.35,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "청결도",
                        style: TextStyle(fontSize: fontMedium),
                      ),
                      Row(
                        children: [
                          getStarIcon(0, campInfo.campInfo.cleanlinessAverage),
                          getStarIcon(1, campInfo.campInfo.cleanlinessAverage),
                          getStarIcon(2, campInfo.campInfo.cleanlinessAverage),
                          getStarIcon(3, campInfo.campInfo.cleanlinessAverage),
                          getStarIcon(4, campInfo.campInfo.cleanlinessAverage),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("관리수준", style: TextStyle(fontSize: fontMedium)),
                      Row(
                        children: [
                          getStarIcon(
                              0, campInfo.campInfo.managementnessAverage),
                          getStarIcon(
                              1, campInfo.campInfo.managementnessAverage),
                          getStarIcon(
                              2, campInfo.campInfo.managementnessAverage),
                          getStarIcon(
                              3, campInfo.campInfo.managementnessAverage),
                          getStarIcon(
                              4, campInfo.campInfo.managementnessAverage),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("친절도", style: TextStyle(fontSize: fontMedium)),
                      Row(
                        children: [
                          getStarIcon(0, campInfo.campInfo.friendlinessAverage),
                          getStarIcon(1, campInfo.campInfo.friendlinessAverage),
                          getStarIcon(2, campInfo.campInfo.friendlinessAverage),
                          getStarIcon(3, campInfo.campInfo.friendlinessAverage),
                          getStarIcon(4, campInfo.campInfo.friendlinessAverage),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Icon getStarIcon(int index, double? rating) {
  if (rating != null) {
    if (rating >= index + 1) {
      return iconFullStar(mSize: fontSmall); // fullIcon
    } else if (rating >= index + 0.5) {
      return iconHalfStar(mSize: fontSmall); // halfIcon
    }
  }
  return iconEmptyStar(mSize: fontSmall); // emptyIcon
}
