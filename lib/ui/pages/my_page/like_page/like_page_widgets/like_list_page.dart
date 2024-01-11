import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/move.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/pages/my_page/like_page/like_page_widgets/like_page_view_model.dart';

class LikeListPage extends ConsumerWidget {
  const LikeListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    LikePageModel? model = ref.watch(likePageProvider);

    if (model == null) {
      return CircularProgressIndicator();
    }

    return CustomScrollView(
      slivers: [
        SliverList(

          delegate: SliverChildBuilderDelegate(
                (context, index) {
                  CampBookmarkDTO campBookmarkList = model!.campBookmarkList![index];
              return InkWell(
                child: ListTile(
                  leading: ClipRRect(
                    child: Image.network("http://192.168.0.134:8080${campBookmarkList.campImage}", width: 65, height: 65, fit: BoxFit.cover,),
                    borderRadius: BorderRadius.circular(gapMedium),
                  ),
                  title: Text(
                    "${campBookmarkList.campName}",
                    style: TextStyle(
                        fontSize: fontSemiMedium,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${campBookmarkList.campAddress}",
                        style: TextStyle(
                            fontSize: fontMedium, color: kFontContent),
                      ),
                      Row(
                        children: [
                          iconFullStar(
                              mColor: kReviewColor, mSize: gapSemiMedium),
                          Text(
                            "${campBookmarkList.campRating}",
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
            childCount: model!.campBookmarkList!.length,
          ),
        )
      ],
    );
  }
}
