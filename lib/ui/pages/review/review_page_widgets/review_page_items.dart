import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';

class ReviewPageItems extends StatelessWidget {
  const ReviewPageItems({super.key});

  @override
  Widget build(BuildContext context) {
    return         Expanded(
      child: Container(
        decoration: BoxDecoration(color: kBackWhite),
        child: Padding(
          padding: const EdgeInsets.all(gapMain),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    "리뷰(1개)",
                    style: TextStyle(
                        fontSize: gapSemiMedium,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("nickname"),
                          Row(
                            children: [
                              iconFullStar(mSize: fontMedium),
                              iconFullStar(mSize: fontMedium),
                              iconFullStar(mSize: fontMedium),
                              iconFullStar(mSize: fontMedium),
                              iconFullStar(mSize: fontMedium),
                            ],
                          )
                        ],
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("createdAt"),
                        ],
                      ),
                    ),
                    Text("시설이 깨끗해서 아주 좋았습니다. \n캠장님도 재밌으시고 친절하세요"),
                    Divider()
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
