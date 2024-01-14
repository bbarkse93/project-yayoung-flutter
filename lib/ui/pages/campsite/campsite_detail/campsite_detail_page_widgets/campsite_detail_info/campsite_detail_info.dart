import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/data/model/campsite_detail.dart';

class CampsiteDetailInfo extends StatelessWidget {
  final CampsiteDetail campInfo;

  const CampsiteDetailInfo({required this.campInfo, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "캠핑장 정보/운영 규정",
          style: TextStyle(fontSize: fontLarge, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: EdgeInsets.all(gapSmall),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "취소/환불 기준",
                    style: TextStyle(
                        color: kFontTitle, fontWeight: FontWeight.bold),
                  ),
                  Text("${campInfo.campRefundPolicy}")
                ],
              ),
              SizedBox(height: gapMedium),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "양수도 가능여부",
                    style: TextStyle(
                        color: kFontTitle, fontWeight: FontWeight.bold),
                  ),
                  Text((campInfo.campWater != null) ? "가능" : "불가")
                ],
              ),
              SizedBox(height: gapMedium),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "쓰레기봉투 지급여부",
                    style: TextStyle(
                        color: kFontTitle, fontWeight: FontWeight.bold),
                  ),
                  Text((campInfo.campGarbageBag != null) ? "지급" : "미지급")
                ],
              ),
              SizedBox(height: gapMedium),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "정기 휴무",
                    style: TextStyle(
                        color: kFontTitle, fontWeight: FontWeight.bold),
                  ),
                  Text("${campInfo.holiday}")
                ],
              ),
              SizedBox(height: gapMedium),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "체크인 / 체크아웃",
                    style: TextStyle(
                        color: kFontTitle, fontWeight: FontWeight.bold),
                  ),
                  Text("${campInfo.campCheckIn} / ${campInfo.campCheckOut}")
                ],
              ),
              SizedBox(height: gapMedium),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "전화번호",
                        style: TextStyle(
                            color: kFontTitle, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(gapSmall)),
                          child: Padding(
                            padding: const EdgeInsets.all(gapXSmall),
                            child: Text(
                              "전화하기 >",
                              style: TextStyle(color: kBackWhite),
                            ),
                          ),
                        ),
                        onTap: () {},
                      )
                    ],
                  ),
                  Text("${campInfo.campCallNumber}")
                ],
              ),
              SizedBox(height: gapMedium),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "홈페이지",
                        style: TextStyle(
                            color: kFontTitle, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(gapSmall)),
                          child: Padding(
                            padding: const EdgeInsets.all(gapXSmall),
                            child: Text(
                              "연결하기 >",
                              style: TextStyle(color: kBackWhite),
                            ),
                          ),
                        ),
                        onTap: () {},
                      )
                    ],
                  ),
                  Text("${campInfo.campWebsite}")
                ],
              ),
              SizedBox(height: gapMedium),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "위치",
                        style: TextStyle(
                            color: kFontTitle, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(gapSmall)),
                          child: Padding(
                            padding: const EdgeInsets.all(gapXSmall),
                            child: Text(
                              "지도보기 >",
                              style: TextStyle(color: kBackWhite),
                            ),
                          ),
                        ),
                        onTap: () {},
                      )
                    ],
                  ),
                  Text("${campInfo.campAddress}")
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}