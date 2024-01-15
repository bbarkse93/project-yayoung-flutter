import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/data/model/campsite_detail.dart';

class CampsiteDetailHaveFacility extends StatelessWidget {
  final CampsiteDetail campsiteDetail;
  const CampsiteDetailHaveFacility({super.key, required this.campsiteDetail});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "보유 시설",
          style: TextStyle(fontSize: fontLarge, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.all(gapSmall),
          child: SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: campsiteDetail.haveFacility?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                var haveFacilityOption = campsiteDetail.haveFacility?[index];
                return Row(
                  children: [
                    Column(
                      children: [
                        getImageWidget("${haveFacilityOption?.optionName}"),
                        Text(
                          "${haveFacilityOption?.optionName}",
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
    case "샤워장":
      return imageDetailShower(
        mHeight: gapSemiLarge,
        mWidth: gapSemiLarge,
      );
    case "온수":
      return imageDetailHotwater(
        mHeight: gapSemiLarge,
        mWidth: gapSemiLarge,
      );
    case "매점":
      return imageDetailSchoolStore(
        mHeight: gapSemiLarge,
        mWidth: gapSemiLarge,
      );
    case "물놀이장":
      return imageDetailWaterSlide(
        mHeight: gapSemiLarge,
        mWidth: gapSemiLarge,
      );
  // Add more cases for each optionName
    default:
      return Container(); // Default case, return an empty container or a default image
  }
}
