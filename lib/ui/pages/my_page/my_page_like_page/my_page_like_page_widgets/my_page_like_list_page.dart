import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/move.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/pages/my_page/my_page_like_page/my_page_like_page_widgets/my_page_like_page_view_model.dart';

import '../../../campsite/campsite_detail/campsite_detail_page.dart';

class LikeListPage extends ConsumerWidget {
  const LikeListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    LikePageModel? model = ref.watch(likePageProvider);

    if (model == null) {
      return Center(child: CircularProgressIndicator());
    }

    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
               if(model.campBookmarkList!.isEmpty) {
                return Column(
                  children: [
                    Container(
                      height: getScreenHeight(context) * 0.9,
                      width: getScreenWidth(context) * 1.0,
                      child: imageLikePage(),
                    ),
                  ],
                );
                  }
                  else {
                 CampBookmarkDTO campBookmarkList = model!.campBookmarkList![index];
                 return InkWell(
                      child: ListTile(
                        leading: ClipRRect(
                          child: Image.network("${dio.options.baseUrl}${campBookmarkList.campImage}", width: 65, height: 65, fit: BoxFit.cover,),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CampsiteDetailPage(campId: campBookmarkList.campId!)));
                      },
                    );
                  }

            },
            childCount: model.campBookmarkList!.isEmpty ? 1 : model!.campBookmarkList!.length,
          ),
        )
      ],
    );
  }
}
