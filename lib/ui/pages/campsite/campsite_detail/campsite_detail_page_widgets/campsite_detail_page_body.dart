import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/pages/campsite/campsite_detail/campsite_detail_page_widgets/campsite_detail_header.dart';
import 'package:team_project/ui/pages/campsite/campsite_detail/campsite_detail_page_widgets/campsite_detail_review.dart';

class CampsiteDetailPageBody extends StatelessWidget {
  const CampsiteDetailPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CampsiteDetailHeader(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (index == 0) {
                  return CampsiteDetailReview();
                }
                return Padding(
                  padding: const EdgeInsets.all(gapMain),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "환경",
                            style: TextStyle(
                                fontSize: fontLarge,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(gapSmall),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    imageDetailMountains(
                                        mHeight: gapSemiLarge,
                                        mWidth: gapSemiLarge),
                                    Text(
                                      "산",
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                SizedBox(width: gapMedium),
                                Column(
                                  children: [
                                    imageDetailValley(
                                        mHeight: gapSemiLarge,
                                        mWidth: gapSemiLarge),
                                    Text(
                                      "계곡",
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "환경",
                            style: TextStyle(
                                fontSize: fontLarge,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(gapSmall),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    imageDetailMountains(
                                        mHeight: gapSemiLarge,
                                        mWidth: gapSemiLarge),
                                    Text(
                                      "산",
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                SizedBox(width: gapMedium),
                                Column(
                                  children: [
                                    imageDetailValley(
                                        mHeight: gapSemiLarge,
                                        mWidth: gapSemiLarge),
                                    Text(
                                      "계곡",
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "환경",
                            style: TextStyle(
                                fontSize: fontLarge,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(gapSmall),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    imageDetailMountains(
                                        mHeight: gapSemiLarge,
                                        mWidth: gapSemiLarge),
                                    Text(
                                      "산",
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                SizedBox(width: gapMedium),
                                Column(
                                  children: [
                                    imageDetailValley(
                                        mHeight: gapSemiLarge,
                                        mWidth: gapSemiLarge),
                                    Text(
                                      "계곡",
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Divider(),
                    ],
                  ),
                );
              },
              childCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
