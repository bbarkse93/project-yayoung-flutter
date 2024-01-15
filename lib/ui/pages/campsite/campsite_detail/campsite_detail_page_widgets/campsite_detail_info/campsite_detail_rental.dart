import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/data/model/campsite_detail.dart';

class CampsiteDetailRental extends StatelessWidget {
  final CampsiteDetail campsiteDetail;
  const CampsiteDetailRental({super.key, required this.campsiteDetail});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "대여 물품",
          style: TextStyle(fontSize: fontLarge, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.all(gapSmall),
          child: SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: campsiteDetail.rental?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                var rentalOption = campsiteDetail.rental?[index];
                return Row(
                  children: [
                    Column(
                      children: [
                        getImageWidget("${rentalOption?.optionName}"),
                        Text(
                          "${rentalOption?.optionName}",
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
    case "릴선":
      return imageDetailReelWire(
        mHeight: gapSemiLarge,
        mWidth: gapSemiLarge,
      );
    case "낚시대":
      return imageDetailFishing(
        mHeight: gapSemiLarge,
        mWidth: gapSemiLarge,
      );
    case "난로":
      return imageDetailPelletStove(
        mHeight: gapSemiLarge,
        mWidth: gapSemiLarge,
      );
  // Add more cases for each optionName
    default:
      return Container(); // Default case, return an empty container or a default image
  }
}
