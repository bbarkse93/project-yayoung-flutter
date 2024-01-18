import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/pages/review/review_page_view_model.dart';
import 'package:team_project/ui/pages/review/review_page_widgets/review_page_header.dart';
import 'package:team_project/ui/pages/review/review_page_widgets/review_page_items.dart';

class ReviewBody extends StatelessWidget {
  ReviewListModel? model;
  int? campId;

  ReviewBody({super.key, required this.model, required this.campId});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReviewPageHeader(campId: campId,),
        Padding(
          padding: const EdgeInsets.only(top: gapMain, left: gapMain),
          child: Container(
            child: Text(
              "리뷰(${model?.campReviewList?.campReviewCount ?? 0}개)",
              style: TextStyle(
                  fontSize: gapSemiMedium, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        if (model != null && model!.campReviewList != null)
          ReviewPageItems(model: model)
        else
          SizedBox(
            height: 300,
            child: Center(child: Text("등록된 리뷰가 없습니다.")),
          ),
      ],
    );
  }
}
