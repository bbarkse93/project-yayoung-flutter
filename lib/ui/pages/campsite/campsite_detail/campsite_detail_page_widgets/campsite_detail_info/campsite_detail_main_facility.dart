import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/data/model/campsite_detail.dart';

class CampsiteDetailMainFacility extends StatelessWidget {
  final CampsiteDetail campsiteDetail;
  const CampsiteDetailMainFacility({super.key, required this.campsiteDetail});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "주요 시설",
          style: TextStyle(fontSize: fontLarge, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.all(gapSmall),
          child: Row(
            children: [
              Column(
                children: [
                  imageDetailMountains(
                      mHeight: gapSemiLarge, mWidth: gapSemiLarge),
                  Text(
                    "산",
                    style: TextStyle(
                        color: kPrimaryColor, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(width: gapMedium),
              Column(
                children: [
                  imageDetailValley(
                      mHeight: gapSemiLarge, mWidth: gapSemiLarge),
                  Text(
                    "계곡",
                    style: TextStyle(
                        color: kPrimaryColor, fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
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
    case "산":
      return imageDetailMountains(
        mHeight: gapSemiLarge,
        mWidth: gapSemiLarge,
      );
    case "계곡":
      return imageDetailValley(
        mHeight: gapSemiLarge,
        mWidth: gapSemiLarge,
      );
    case "바다":
      return imageDetailBeach(
        mHeight: gapSemiLarge,
        mWidth: gapSemiLarge,
      );
    case "도시":
      return imageDetailCity(
        mHeight: gapSemiLarge,
        mWidth: gapSemiLarge,
      );
    case "섬":
      return imageDetailIsland(
        mHeight: gapSemiLarge,
        mWidth: gapSemiLarge,
      );
  // Add more cases for each optionName
    default:
      return Container(); // Default case, return an empty container or a default image
  }
}
