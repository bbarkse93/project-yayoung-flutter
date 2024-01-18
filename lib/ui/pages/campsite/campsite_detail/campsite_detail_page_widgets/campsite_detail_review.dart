import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/move.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/data/model/camp.dart';
import 'package:team_project/data/model/campsite_detail.dart';
import 'package:team_project/ui/pages/review/review_page.dart';

class CampsiteDetailReview extends StatelessWidget {
  final CampsiteDetail campInfo;

  const CampsiteDetailReview({super.key, required this.campInfo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: gapMain, left: gapMain, right: gapMain),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(gapMedium),
                    child: Text(
                      "평점",
                      style: TextStyle(
                          fontSize: fontSemiMedium,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text("${campInfo.totalRating}",
                      style: TextStyle(
                        fontSize:
                        campInfo.totalRating == "평가없음" ? fontMedium : fontXxlarge,
                        fontWeight: campInfo.totalRating == "평가없음" ? FontWeight.w400 : FontWeight.bold,
                      )),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.3615,
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(gapMedium),
                        child: Text(
                          "세부항목",
                          style: TextStyle(
                              fontSize: fontSemiMedium,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "청결도",
                            style: TextStyle(fontSize: fontMedium),
                          ),

                          Row(
                            children: [
                              getStarIcon(0, campInfo.cleanlinessAverage),
                              getStarIcon(1, campInfo.cleanlinessAverage),
                              getStarIcon(2, campInfo.cleanlinessAverage),
                              getStarIcon(3, campInfo.cleanlinessAverage),
                              getStarIcon(4, campInfo.cleanlinessAverage),
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
                                getStarIcon(0, campInfo.managementnessAverage),
                                getStarIcon(1, campInfo.managementnessAverage),
                                getStarIcon(2, campInfo.managementnessAverage),
                                getStarIcon(3, campInfo.managementnessAverage),
                                getStarIcon(4, campInfo.managementnessAverage),
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
                              getStarIcon(0, campInfo.friendlinessAverage),
                              getStarIcon(1, campInfo.friendlinessAverage),
                              getStarIcon(2, campInfo.friendlinessAverage),
                              getStarIcon(3, campInfo.friendlinessAverage),
                              getStarIcon(4, campInfo.friendlinessAverage),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(gapMedium),
                    child: Text(
                      "리뷰 수",
                      style: TextStyle(
                          fontSize: fontSemiMedium,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "${campInfo.reviewCount}",
                    style: TextStyle(
                        fontSize: gapLarge, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    child: Text("전체리뷰보기"),
                    onTap: () {
                      Navigator.of(context).pushNamed(Move.reviewPage, arguments: campInfo.id);
                    },
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

Icon getStarIcon(int index, double? rating) {
  if (rating != null) {
    if (rating >= index + 1) {
      return iconFullStar(mSize: fontLarge); // fullIcon
    } else if (rating >= index + 0.5) {
      return iconHalfStar(mSize: fontLarge); // halfIcon
    }
  }
  return iconEmptyStar(mSize: fontLarge); // emptyIcon
}