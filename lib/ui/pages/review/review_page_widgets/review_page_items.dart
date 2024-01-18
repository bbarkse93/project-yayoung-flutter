import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/pages/review/review_page_view_model.dart';

class ReviewPageItems extends StatelessWidget {
  ReviewListModel? model;

  ReviewPageItems({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    if(model == null) {
      return Expanded(
        child: Container(
          decoration: BoxDecoration(color: kBlack),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: gapMain),
           child: Text("값이 없습니다!!! ",style: TextStyle(fontSize: 100),),
          ),
        ),
      );
    }
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
                        Text(
                            "${model?.campReviewList?.campReviewList?[index].createdAt}"),
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
