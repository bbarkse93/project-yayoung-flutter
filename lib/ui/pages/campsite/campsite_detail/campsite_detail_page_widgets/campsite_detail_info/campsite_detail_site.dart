import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/data/model/campsite_detail.dart';

class CampsiteDetailSite extends StatelessWidget {
  final CampsiteDetail campsiteDetail;
  const CampsiteDetailSite({super.key, required this.campsiteDetail});

  @override
  Widget build(BuildContext context) {
    return                 Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "사이트 형태",
          style: TextStyle(
              fontSize: fontLarge, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.all(gapSmall),
          child: SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: campsiteDetail.site?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                var siteOption = campsiteDetail.site?[index];
                return Row(
                  children: [
                    Column(
                      children: [
                        getImageWidget("${siteOption?.optionName}"),
                        Text(
                          "${siteOption?.optionName}",
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
    case "데크":
      return imageDetailMountains(
        mHeight: gapSemiLarge,
        mWidth: gapSemiLarge,
      );
    case "파쇄석":
      return imageDetailValley(
        mHeight: gapSemiLarge,
        mWidth: gapSemiLarge,
      );
    case "잔디":
      return imageDetailBeach(
        mHeight: gapSemiLarge,
        mWidth: gapSemiLarge,
      );
  // Add more cases for each optionName
    default:
      return Container(); // Default case, return an empty container or a default image
  }
}
