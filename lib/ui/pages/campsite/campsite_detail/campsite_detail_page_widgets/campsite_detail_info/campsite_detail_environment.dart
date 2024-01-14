import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/data/model/campsite_detail.dart';

class CampsiteDetailEnvironment extends StatelessWidget {
  final CampsiteDetail campsiteDetail;

  const CampsiteDetailEnvironment({super.key, required this.campsiteDetail});

  @override
  Widget build(BuildContext context) {
    Logger().d("이거 값 뭐임?${campsiteDetail.environment?[0].optionName}");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "환경",
          style: TextStyle(fontSize: fontLarge, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.all(gapSmall),
          child: SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: campsiteDetail.environment?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                var environmentOption = campsiteDetail.environment?[index];
                return Row(
                  children: [
                    Column(
                      children: [
                        getImageWidget("${environmentOption?.optionName}"),
                        Text(
                          "${environmentOption?.optionName}",
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
