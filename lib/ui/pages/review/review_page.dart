import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/data/model/camp.dart';
import 'package:team_project/data/model/campsite_detail.dart';
import 'package:team_project/ui/pages/campsite/campsite_detail/campsite_detail_view_model.dart';
import 'package:team_project/ui/pages/review/review_page_view_model.dart';
import 'package:team_project/ui/pages/review/review_page_widgets/review_appbar.dart';
import 'package:team_project/ui/pages/review/review_page_widgets/review_body.dart';

class ReviewPage extends ConsumerWidget {
  int campId;

  ReviewPage({super.key, required this.campId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ReviewListModel? model = ref.watch(reviewListProvider(campId ?? 0));

  if (model != null) {
    return Scaffold(
      appBar: ReviewAppbar(),
      body: ReviewBody(model: model),
    );
  }
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
