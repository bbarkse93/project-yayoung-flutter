import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';

class ReviewBottomSheet extends StatelessWidget {
  const ReviewBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final reviewContent = TextEditingController();
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
                      "캠핑장 이름",
                      style: TextStyle(
                          fontSize: fontLarge, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "캠핑장 주소",
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
                // 사진 넣을 때 살리면 됨
                // InkWell(
                //   child: Container(
                //     decoration: BoxDecoration(
                //         color: kBackLightGray,
                //         borderRadius: BorderRadius.circular(gapSmall)),
                //     child: Padding(
                //       padding: const EdgeInsets.all(gapSmall),
                //       child: Row(
                //         children: [
                //           iconPicture(),
                //           SizedBox(
                //             width: gapXSmall,
                //           ),
                //           Text("추가하기"),
                //         ],
                //       ),
                //     ),
                //   ),
                //   onTap: () {},
                // )
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
                      iconFullStar(),
                      iconFullStar(),
                      iconFullStar(),
                      iconFullStar(),
                      iconFullStar(),
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
                      iconFullStar(),
                      iconFullStar(),
                      iconFullStar(),
                      iconFullStar(),
                      iconFullStar(),
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
                    children: [
                      iconFullStar(),
                      iconFullStar(),
                      iconFullStar(),
                      iconFullStar(),
                      iconFullStar(),
                    ],
                  ),
                  onTap: () {},
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
              onTap: () {

              },
            )
          ],
        ),
      ),
    );
  }
}
