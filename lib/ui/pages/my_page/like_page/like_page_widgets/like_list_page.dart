import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/move.dart';
import 'package:team_project/_core/constants/size.dart';

class LikeListPage extends StatelessWidget {
  const LikeListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              return InkWell(
                child: ListTile(
                  leading: ClipRRect(
                    child: Image.network("https://picsum.photos/150"),
                    borderRadius: BorderRadius.circular(gapMedium),
                  ),
                  title: Text(
                    "강릉여행 굿캠핑",
                    style: TextStyle(
                        fontSize: fontSemiMedium,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "강원 강릉시 사천면 방동리 112-5",
                        style: TextStyle(
                            fontSize: fontMedium, color: kFontContent),
                      ),
                      Row(
                        children: [
                          iconFullStar(
                              mColor: kReviewColor, mSize: gapSemiMedium),
                          Text(
                            "평가없음",
                            style: TextStyle(
                                fontSize: fontSemiMedium,
                                color: kFontContent),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, Move.campsiteDetailPage);
                },
              );
            },
            childCount: 5,
          ),
        )
      ],
    );
  }
}
