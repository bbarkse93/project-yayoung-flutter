import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';

class CampsiteBottomSheetFilter extends StatelessWidget {
  const CampsiteBottomSheetFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      decoration: BoxDecoration(
          color: kBackWhite, borderRadius: BorderRadius.circular(gapMedium)),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: gapMain, vertical: gapXxLarge),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "필터",
                  style: TextStyle(
                      fontSize: fontLarge, fontWeight: FontWeight.bold),
                ),
                Text(
                  "필터해제",
                  style:
                      TextStyle(fontSize: fontSemiMedium, color: kPrimaryColor),
                ),
              ],
            ),
            Divider(),
            SizedBox(height: gapMedium),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "위치",
                  style: TextStyle(fontSize: fontSemiMedium),
                ),
                InkWell(
                  child: Row(
                    children: [
                      Text(
                        "제한 없음",
                        style: TextStyle(fontSize: fontSemiMedium),
                      ),
                      iconArrowForward(
                          mColor: kBlack, mSize: gapSemiMedium)
                    ],
                  ),
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(height: gapMedium),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "환경",
                  style: TextStyle(fontSize: fontSemiMedium),
                ),
                InkWell(
                  child: Row(
                    children: [
                      Text(
                        "제한 없음",
                        style: TextStyle(fontSize: fontSemiMedium),
                      ),
                      iconArrowForward(
                          mColor: kBlack, mSize: gapSemiMedium)
                    ],
                  ),
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(height: gapMedium),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "이용규정",
                  style: TextStyle(fontSize: fontSemiMedium),
                ),
                InkWell(
                  child: Row(
                    children: [
                      Text(
                        "제한 없음",
                        style: TextStyle(fontSize: fontSemiMedium),
                      ),
                      iconArrowForward(
                          mColor: kBlack, mSize: gapSemiMedium)
                    ],
                  ),
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(height: gapMedium),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "시설/프로그램",
                  style: TextStyle(fontSize: fontSemiMedium),
                ),
                InkWell(
                  child: Row(
                    children: [
                      Text(
                        "제한 없음",
                        style: TextStyle(fontSize: fontSemiMedium),
                      ),
                      iconArrowForward(
                          mColor: kBlack, mSize: gapSemiMedium)
                    ],
                  ),
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(height: gapMedium),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "반려동물",
                  style: TextStyle(fontSize: fontSemiMedium),
                ),
                InkWell(
                  child: Row(
                    children: [
                      Text(
                        "제한 없음",
                        style: TextStyle(fontSize: fontSemiMedium),
                      ),
                      iconArrowForward(
                          mColor: kBlack, mSize: gapSemiMedium)
                    ],
                  ),
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(height: gapMedium),
          ],
        ),
      ),
    );
  }
}
