import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/pages/review/review_page_widgets/review_appbar.dart';
import 'package:team_project/ui/pages/review/review_page_widgets/review_body.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReviewAppbar(),
      body: ReviewBody(),
    );
  }
}

