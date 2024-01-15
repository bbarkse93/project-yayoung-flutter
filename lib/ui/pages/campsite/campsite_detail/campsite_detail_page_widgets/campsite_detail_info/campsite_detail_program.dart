import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/data/model/campsite_detail.dart';

class CampsiteDetailProgram extends StatelessWidget {
  final CampsiteDetail campsiteDetail;
  const CampsiteDetailProgram({super.key, required this.campsiteDetail});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "프로그램 및 활동",
          style: TextStyle(fontSize: fontLarge, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.all(gapSmall),
          child: SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: campsiteDetail.program?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                var programOption = campsiteDetail.program?[index];
                return Row(
                  children: [
                    Column(
                      children: [
                        getImageWidget("${programOption?.optionName}"),
                        Text(
                          "${programOption?.optionName}",
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: gapMedium),
                  ],
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: gapMedium),
          child: Divider(),
        ),
      ],
    );
  }
}

Widget getImageWidget(String optionName) {
  switch (optionName) {
    case "계곡·물놀이":
      return imageDetailWaterPolo(
        mHeight: gapSemiLarge,
        mWidth: gapSemiLarge,
      );
    case "해수욕":
      return imageDetailBeach(
        mHeight: gapSemiLarge,
        mWidth: gapSemiLarge,
      );
    case "갯벌체험":
      return imageDetailMud(
        mHeight: gapSemiLarge,
        mWidth: gapSemiLarge,
      );
    case "낚시":
      return imageDetailCity(
        mHeight: gapSemiLarge,
        mWidth: gapSemiLarge,
      );
    case "등산(트래킹)":
      return imageDetailHiking(
        mHeight: gapSemiLarge,
        mWidth: gapSemiLarge,
      );
  // Add more cases for each optionName
    default:
      return Container(); // Default case, return an empty container or a default image
  }

}
