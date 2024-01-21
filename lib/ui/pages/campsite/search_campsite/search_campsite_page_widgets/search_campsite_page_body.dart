import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/move.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/data/model/camp.dart';
import 'package:team_project/ui/pages/campsite/campsite_detail/campsite_detail_page.dart';
import 'package:team_project/ui/pages/campsite/search_campsite/search_campsite_view_model.dart';

class SearchCampsitePageBody extends ConsumerWidget {

  const SearchCampsitePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SearchModel? model = ref.watch(searchProvider);
    List<Camp> campList = [];

    if (model == null) {
      return const SliverToBoxAdapter(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
campList = model!.campList!;
    
    
    return Container(
      decoration: BoxDecoration(color: kSubColor),
      child: campList.isNotEmpty 
       ? ListView.builder(
        itemCount: campList.length,
        itemBuilder: (context, index) {
          return InkWell(
            child: Container(
              child: ListTile(
                title: Text(
                  "${campList[index].campName}",
                  style:
                      TextStyle(fontSize: fontLarge, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "${campList[index].campAddress}",
                  style: TextStyle(fontSize: fontSemiMedium),
                ),
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
        },
      )
          : Center(child: Text("캠핑장 이름을 2글자 이상 입력해주세요.", style: TextStyle(color: kFontContent),))
    );
  }
}
