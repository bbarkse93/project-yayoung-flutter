import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/data/model/campsite_detail.dart';

class CampsiteDetailType extends StatelessWidget {
  final CampsiteDetail campsiteDetail;
  const CampsiteDetailType({super.key, required this.campsiteDetail});

  @override
  Widget build(BuildContext context) {
    return                 Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "캠핑유형",
          style: TextStyle(
              fontSize: fontLarge, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.all(gapSmall),
          child: SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: campsiteDetail.type?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                var typeOption = campsiteDetail.type?[index];
                return Row(
                  children: [
                    Column(
                      children: [
                        getImageWidget("${typeOption?.optionName}"),
                        Text(
                          "${typeOption?.optionName}",
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
        )
      ],
    );
  }
}

Widget getImageWidget(String optionName) {
  switch (optionName) {
    case "트레일러":
      return imageDetailMountains(
        mHeight: gapSemiLarge,
        mWidth: gapSemiLarge,
      );
    case "모터홈":
      return imageDetailValley(
        mHeight: gapSemiLarge,
        mWidth: gapSemiLarge,
      );
    case "카라반":
      return imageDetailBeach(
        mHeight: gapSemiLarge,
        mWidth: gapSemiLarge,
      );
    case "오토캠핑":
      return imageDetailCity(
        mHeight: gapSemiLarge,
        mWidth: gapSemiLarge,
      );
    case "차박":
      return imageDetailIsland(
        mHeight: gapSemiLarge,
        mWidth: gapSemiLarge,
      );
  // Add more cases for each optionName
    default:
      return Container(); // Default case, return an empty container or a default image
  }
}