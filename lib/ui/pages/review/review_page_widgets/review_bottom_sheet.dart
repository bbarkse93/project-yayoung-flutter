import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/data/dto/review_request_dto.dart';
import 'package:team_project/data/model/campsite_detail.dart';
import 'package:team_project/ui/pages/campsite/campsite_detail/campsite_detail_view_model.dart';
import 'package:team_project/ui/pages/review/review_page_view_model.dart';

class ReviewBottomSheet extends ConsumerStatefulWidget {
  int? campId;

  ReviewBottomSheet({
    super.key,
    required this.campId,
  });

  @override
  ConsumerState<ReviewBottomSheet> createState() => _ReviewBottomSheetState();
}

class _ReviewBottomSheetState extends ConsumerState<ReviewBottomSheet> {
  final reviewContent = TextEditingController();
  CampDetailModel? campInfo;
  int cleanlinessRating = 0;
  int managementnessRating = 0;
  int friendlinessRating = 0;




  @override
  Widget build(BuildContext context) {
    campInfo = ref.watch(campsiteDetailProvider(widget.campId ?? 0));
    if (campInfo == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    CampsiteDetail campDetail = campInfo!.campInfo;



    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
          color: kBackWhite, borderRadius: BorderRadius.circular(gapMedium)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: gapMain, vertical: gapXLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${campDetail.campName}",
                      style: TextStyle(
                          fontSize: fontLarge, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${campDetail.campAddress}",
                      style: TextStyle(
                          fontSize: fontMedium, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                InkWell(
                  child: iconClose(),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            const Divider(),
            const SizedBox(height: gapSmall),
            StarRating(
                ratingName: "청결도",
                onRatingChanged: (rating) {
                    cleanlinessRating = rating;
                }),
            StarRating(
                ratingName: "관리수준",
                onRatingChanged: (rating) {
                  managementnessRating = rating;
                  Logger().d("managementnessRating : $managementnessRating");
                }),
            StarRating(
                ratingName: "친절도",
                onRatingChanged: (rating) {
                    friendlinessRating = rating;
                }),
            const SizedBox(height: gapSmall),
            Container(
              decoration: BoxDecoration(
                  color: kBackLightGray,
                  borderRadius: BorderRadius.circular(gapMedium)),
              height: 150,
              child: TextField(
                controller: reviewContent,
                maxLines: null,
                decoration: InputDecoration(
                  fillColor: kBackLightGray,
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: gapSmall, horizontal: gapSmall),
                  hintText: "10자 이상으로 입력해주세요",
                  hintStyle: const TextStyle(
                    color: kFontContent,
                    fontSize: fontMedium,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(gapSmall),
                    borderSide: const BorderSide(color: kBackLightGray),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(gapSmall),
                    borderSide: const BorderSide(color: kBackLightGray),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(gapSmall),
                    borderSide: const BorderSide(color: kBackLightGray),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(gapSmall),
                    borderSide: const BorderSide(color: kBackLightGray),
                  ),
                ),
              ),
            ),
            const SizedBox(height: gapSmall),
            InkWell(
              child: Container(
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(gapXSmall)),
                child: const Padding(
                  padding: EdgeInsets.all(gapMain / 2),
                  child: Center(
                    child: Text(
                      "등록",
                      style: TextStyle(color: kBackWhite, fontSize: fontLarge),
                    ),
                  ),
                ),
              ),
              onTap: () {
                ReviewWriteDTO reviewDTO = ReviewWriteDTO(
                  content: reviewContent.text,
                  cleanliness: cleanlinessRating,
                  managementness: managementnessRating,
                  friendliness: friendlinessRating,
                );
                Logger().d(
                    "content = ${reviewDTO.content}, cleanliness = ${reviewDTO.cleanliness}, managementness = ${reviewDTO.managementness}, friendliness = ${reviewDTO.friendliness}");
                ref.watch(reviewListProvider(campInfo!.campInfo.id ?? 0).notifier).fetchSave(reviewDTO, campInfo!.campInfo.id ?? 0);
              },
            )
          ],
        ),
      ),
    );
  }


}

class StarRating extends StatefulWidget {
  final String ratingName;
  final Function(int) onRatingChanged;

  StarRating({required this.ratingName, required this.onRatingChanged});

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  int rating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${widget.ratingName}",
          style: TextStyle(fontSize: fontSemiMedium),
        ),
        Row(
          children: List.generate(5, (index) {
            return InkWell(
              child: index < rating ? iconFullStar() : iconEmptyStar(),
              onTap: () {
                setState(() {
                  rating = index + 1;
                  widget.onRatingChanged(rating);
                  Logger().d("별점 - ${widget.ratingName}: $rating");
                });
              },
            );
          }),
        ),
      ],
    );
  }
}
