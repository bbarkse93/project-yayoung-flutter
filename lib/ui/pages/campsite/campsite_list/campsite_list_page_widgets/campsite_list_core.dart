import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';

class CampsiteListCore extends StatelessWidget {
  const CampsiteListCore({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return ListTile(
            leading: ClipRRect(
              child: Image.network("https://picsum.photos/200"),
              borderRadius: BorderRadius.circular(gapSemiMedium),
            ),
            title: Text("안녕", style: TextStyle(fontSize: fontSemiMedium, fontWeight: FontWeight.bold),),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("만나서 반가워", style: TextStyle(fontSize: fontMedium, color: kFontContent),),
                Row(
                  children: [
                    iconFullStar(mColor: kReviewColor, mSize: gapSemiMedium),
                    Text("4.5", style: TextStyle(fontSize: fontSemiMedium, color: kFontContent),)
                  ],
                )
              ],
            ),

          );
        },
        childCount: 20,
      ),
    );
  }
}
