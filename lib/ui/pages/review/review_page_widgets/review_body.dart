import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/pages/review/review_page_widgets/review_page_header.dart';
import 'package:team_project/ui/pages/review/review_page_widgets/review_page_items.dart';

class ReviewBody extends StatelessWidget {
  const ReviewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReviewPageHeader(),
        ReviewPageItems(),
      ],
    );
  }
}
