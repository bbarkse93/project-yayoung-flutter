import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/pages/review/review_page_view_model.dart';

class ReviewPageHeader extends StatelessWidget {
  ReviewListModel? model;
  ReviewPageHeader({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getScreenHeight(context) * 0.3,
      decoration: BoxDecoration(color: kSubColor),
      child: Padding(
        padding: const EdgeInsets.all(gapMain),
        child: Column(
          children: [
            Text(
              "${model?.campReviewList?.campName}",
              style:
                  TextStyle(fontSize: fontLarge, fontWeight: FontWeight.bold),
            ),
            Text(
              "별점",
              style: TextStyle(fontSize: fontMax),
            ),
            SizedBox(height: gapMedium,),
            Text("세부항목"),
            Container(
              width: getScreenWidth(context)*0.35,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("청결도"),
                      Row(children: [
                        iconEmptyStar(mSize: fontSmall),
                        iconEmptyStar(mSize: fontSmall),
                        iconEmptyStar(mSize: fontSmall),
                        iconEmptyStar(mSize: fontSmall),
                        iconEmptyStar(mSize: fontSmall)
                      ],)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("관리수준"),
                      Row(children: [
                        iconEmptyStar(mSize: fontSmall),
                        iconEmptyStar(mSize: fontSmall),
                        iconEmptyStar(mSize: fontSmall),
                        iconEmptyStar(mSize: fontSmall),
                        iconEmptyStar(mSize: fontSmall)
                      ],)
                    ],
                  ),Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("친절도"),
                      Row(children: [
                        iconEmptyStar(mSize: fontSmall),
                        iconEmptyStar(mSize: fontSmall),
                        iconEmptyStar(mSize: fontSmall),
                        iconEmptyStar(mSize: fontSmall),
                        iconEmptyStar(mSize: fontSmall)
                      ],)
                    ],
                  )
                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}
