import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/data/model/camp.dart';
import 'package:team_project/ui/pages/campsite/campsite_detail/campsite_detail_page.dart';
import 'package:team_project/ui/pages/campsite/campsite_list/campsite_list_view_model.dart';

class CampsiteListCore extends ConsumerWidget {
  const CampsiteListCore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CampListModel? model = ref.watch(campListProvider);
    List<Camp> campList = model?.campList ?? [];

    if (model == null) {
      return const SliverToBoxAdapter(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          if (campList.isEmpty) {
            return Container(
              height: getScreenWidth(context) * 0.8,
              width: getScreenWidth(context) * 0.8,
              child: imageFilerPage(),
            );
          } else {
            return InkWell(
              child: ListTile(
                leading: SizedBox(
                  width: 60,
                  height: 60,
                  child: ClipRRect(
                    child: Image.network(
                      "${dio.options.baseUrl}${campList[index].campImage}",
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(gapSemiMedium),
                  ),
                ),
                title: Text(
                  "${campList[index].campName}",
                  style: TextStyle(
                    fontSize: fontSemiMedium,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${campList[index].campAddress}",
                      style: TextStyle(
                        fontSize: fontMedium,
                        color: kFontContent,
                      ),
                    ),
                    Row(
                      children: [
                        iconFullStar(
                          mColor: kReviewColor,
                          mSize: gapSemiMedium,
                        ),
                        Text(
                          "${campList[index].campRating}",
                          style: TextStyle(
                            fontSize: fontSemiMedium,
                            color: kFontContent,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CampsiteDetailPage(
                      campId: campList[index].id ?? 0,
                    ),
                  ),
                );
              },
            );
          }
        },
        childCount: campList.isEmpty ? 1 : campList.length,
      ),
    );
  }
}
