import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/data/model/campsite_detail.dart';
import 'package:team_project/ui/pages/campsite/campsite_detail/campsite_detail_view_model.dart';

class ReviewBottomSheet extends ConsumerWidget {
  int? campId;

  ReviewBottomSheet({
    super.key,
    required this.campId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviewContent = TextEditingController();
    CampDetailModel? campInfo = ref.watch(campsiteDetailProvider(campId ?? 0));
    if (campInfo == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    CampsiteDetail campDetail = campInfo.campInfo;
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "청결도",
                  style: TextStyle(fontSize: fontSemiMedium),
                ),
                InkWell(
                  child: Row(
                    children: [
                      iconEmptyStar(),
                      iconEmptyStar(),
                      iconEmptyStar(),
                      iconEmptyStar(),
                      iconEmptyStar(),
                    ],
                  ),
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: gapSmall),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "관리수준",
                  style: TextStyle(fontSize: fontSemiMedium),
                ),
                InkWell(
                  child: Row(
                    children: [
                      iconEmptyStar(),
                      iconEmptyStar(),
                      iconEmptyStar(),
                      iconEmptyStar(),
                      iconEmptyStar(),
                    ],
                  ),
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: gapSmall),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "친절도",
                  style: TextStyle(fontSize: fontSemiMedium),
                ),
                InkWell(
                  child: Row(
                    children: List.generate(
                      5,
                          (index) => index < ref.watch(starRatingProvider)
                          ? iconFullStar()
                          : iconEmptyStar(),
                    ),
                  ),
                  onTap: () {
                    ref.read(starRatingProvider.notifier).setRating(1);
                  },
                ),
              ],
            ),
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
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}


final starRatingProvider = StateNotifierProvider<StarRatingNotifier, int>((ref) {
  return StarRatingNotifier();
});

class StarRatingNotifier extends StateNotifier<int> {
  StarRatingNotifier() : super(0);

  void setRating(int rating) {
    state = rating;
  }
}
