import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/pages/review/review_page_view_model.dart';
import 'package:team_project/ui/pages/review/review_page_widgets/review_page_header.dart';
import 'package:team_project/ui/pages/review/review_page_widgets/review_page_items.dart';

class ReviewBody extends StatelessWidget {
  ReviewListModel? model;

  ReviewBody({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
      if (model != null) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReviewPageHeader(model: model),
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
          ],
        );
      }
      return Container(
        decoration: BoxDecoration(color: kBlack),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: gapMain),
          child: Text(
            "값이 없습니다!!! ",
            style: TextStyle(fontSize: 100),
          ),
        ),
      );
    }
  }

