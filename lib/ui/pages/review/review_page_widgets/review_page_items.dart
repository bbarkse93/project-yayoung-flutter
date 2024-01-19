import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/_core/utils/format_util.dart';
import 'package:team_project/ui/pages/campsite/campsite_detail/campsite_detail_view_model.dart';
import 'package:team_project/ui/pages/review/review_page_view_model.dart';

class ReviewPageItems extends ConsumerWidget {
  ReviewListModel? model;

  ReviewPageItems({super.key, required this.model});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(color: kBackWhite),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: gapMain),
          child: ListView.builder(
            itemCount: model!.campReviewList!.campReviewCount,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        "${dio.options.baseUrl}${model?.campReviewList?.campReviewList?[index].userImage}",
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "${model?.campReviewList?.campReviewList?[index].nickname}"),
                        Row(
                          children: [
                            getStarIcon(0, model?.campReviewList?.campReviewList?[index].totalRating),
                            getStarIcon(1, model?.campReviewList?.campReviewList?[index].totalRating),
                            getStarIcon(2, model?.campReviewList?.campReviewList?[index].totalRating),
                            getStarIcon(3, model?.campReviewList?.campReviewList?[index].totalRating),
                            getStarIcon(4, model?.campReviewList?.campReviewList?[index].totalRating),
                          ],
                        )
                      ],
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            formatDateString(model?.campReviewList?.campReviewList?[index].createdAt ?? "0000/00/00")),
                      ],
                    ),
                  ),
                  Text(
                      "${model?.campReviewList?.campReviewList?[index].content}"),
                  Divider()
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
Icon getStarIcon(int index, double? rating) {
  if (rating != null) {
    if (rating >= index + 1) {
      return iconFullStar(mSize: fontLarge); // fullIcon
    } else if (rating >= index + 0.5) {
      return iconHalfStar(mSize: fontLarge); // halfIcon
    }
  }
  return iconEmptyStar(mSize: fontLarge); // emptyIcon
}