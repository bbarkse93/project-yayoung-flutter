import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/move.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/data/model/campsite_detail.dart';
import 'package:team_project/ui/pages/campsite/campsite_map/campsite_map_page.dart';
import 'package:url_launcher/url_launcher.dart';

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
                        onTap: () {
                          _showBottomSheet(context);
                        },
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
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CampsiteMapPage(
                                  initialAddress: "${campInfo.campAddress}"),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                  Text("${campInfo.campAddress}")
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: gapMedium),
                child: Divider(),
              ),
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(gapMedium),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: gapMedium),
                      child: Text(
                        "예약하기",
                        style: TextStyle(
                            fontSize: fontLarge,
                            fontWeight: FontWeight.bold,
                            color: kBackWhite),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(Move.reservationPage);
                },
              )
            ],
          ),
        ),
      ],
    );
  }

  _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200.0,
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('전화 걸기'),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // 바텀시트 닫기
                    _launchPhoneCall('tel:01085017241');
                    // _launchPhoneCall('tel:${campInfo.campCallNumber}');
                  },
                  child: Text('전화 걸기'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _launchPhoneCall(String phoneNumber) async {
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      throw '전화를 걸 수 없습니다: $phoneNumber';
    }
  }
}
