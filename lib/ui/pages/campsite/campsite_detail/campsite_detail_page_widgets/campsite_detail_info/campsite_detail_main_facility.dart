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
          child: SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: campsiteDetail.mainFacility?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                var mainFacilityOption = campsiteDetail.mainFacility?[index];
                return Row(
                  children: [
                    Column(
                      children: [
                        getImageWidget("${mainFacilityOption?.optionName}"),
                        Text(
                          "${mainFacilityOption?.optionName}",
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
    case "전기":
      return imageDetailSocket(
        mHeight: gapSemiLarge,
        mWidth: gapSemiLarge,
      );
    case "Wi-Fi":
      return imageDetailWifi(
        mHeight: gapSemiLarge,
        mWidth: gapSemiLarge,
      );
    case "화로대":
      return imageDetailBBQ(
        mHeight: gapSemiLarge,
        mWidth: gapSemiLarge,
      );
    case "반려동물":
      return imageDetailPet(
        mHeight: gapSemiLarge,
        mWidth: gapSemiLarge,
      );
    case "키즈":
      return imageDetailKids(
        mHeight: gapSemiLarge,
        mWidth: gapSemiLarge,
      );
  // Add more cases for each optionName
    default:
      return Container(); // Default case, return an empty container or a default image
  }
}
