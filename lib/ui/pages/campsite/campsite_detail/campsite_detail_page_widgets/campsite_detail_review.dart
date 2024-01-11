import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/data/model/camp.dart';
import 'package:team_project/data/model/campsite_detail.dart';

class CampsiteDetailReview extends StatelessWidget {
  final CampInfo campInfo;

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
                  Text(campInfo.totalRating != null ? "${campInfo.totalRating}" : "평점 없음",
                      style: TextStyle(
                        fontSize:
                        campInfo.totalRating != null ? fontXxlarge : fontMedium,
                        fontWeight: campInfo.totalRating != null ? FontWeight.bold : FontWeight.bold,
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
                              iconEmptyStar(mSize: fontLarge),
                              iconEmptyStar(mSize: fontLarge),
                              iconEmptyStar(mSize: fontLarge),
                              iconEmptyStar(mSize: fontLarge),
                              iconEmptyStar(mSize: fontLarge),
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
                              iconEmptyStar(mSize: fontLarge),
                              iconEmptyStar(mSize: fontLarge),
                              iconEmptyStar(mSize: fontLarge),
                              iconEmptyStar(mSize: fontLarge),
                              iconEmptyStar(mSize: fontLarge),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("청결도", style: TextStyle(fontSize: fontMedium)),
                          Row(
                            children: [
                              iconEmptyStar(mSize: fontLarge),
                              iconEmptyStar(mSize: fontLarge),
                              iconEmptyStar(mSize: fontLarge),
                              iconEmptyStar(mSize: fontLarge),
                              iconEmptyStar(mSize: fontLarge),
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
                    "1",
                    style: TextStyle(
                        fontSize: gapLarge, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    child: Text("전체리뷰보기"),
                    onTap: () {},
                  ),
                ],
              )
            ],
          ),
          Divider()
        ],
      ),
    );
  }
}
