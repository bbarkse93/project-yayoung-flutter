import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/data/model/campsite_detail.dart';

class CampsiteDetailExerciseFacility extends StatelessWidget {
  final CampsiteDetail campsiteDetail;
  const CampsiteDetailExerciseFacility({super.key, required this.campsiteDetail});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "운동 시설",
          style: TextStyle(fontSize: fontLarge, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.all(gapSmall),
          child: SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: campsiteDetail.exerciseFacility?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                var exerciseOption = campsiteDetail.exerciseFacility?[index];
                return Row(
                  children: [
                    Column(
                      children: [
                        getImageWidget("${exerciseOption?.optionName}"),
                        Text(
                          "${exerciseOption?.optionName}",
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
    case "산책로":
      return imageDetailMountains(
        mHeight: gapSemiLarge,
        mWidth: gapSemiLarge,
      );
    case "운동장":
      return imageDetailValley(
        mHeight: gapSemiLarge,
        mWidth: gapSemiLarge,
      );
    case "농구대":
      return imageDetailBeach(
        mHeight: gapSemiLarge,
        mWidth: gapSemiLarge,
      );
    case "축구장":
      return imageDetailCity(
        mHeight: gapSemiLarge,
        mWidth: gapSemiLarge,
      );
    case "족구장":
      return imageDetailIsland(
        mHeight: gapSemiLarge,
        mWidth: gapSemiLarge,
      );
  // Add more cases for each optionName
    default:
      return Container(); // Default case, return an empty container or a default image
  }
}

