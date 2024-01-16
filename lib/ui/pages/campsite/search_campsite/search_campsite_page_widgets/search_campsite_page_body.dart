import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/data/model/camp.dart';
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
      child: ListView.builder(
        itemCount: campList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              // "안녕",
              "${campList[index].campName}",
              style:
                  TextStyle(fontSize: fontLarge, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              // "만나서 반가워",
              "${campList[index].campAddress}",
              style: TextStyle(fontSize: fontSemiMedium),
            ),
          );
        },
      ),
    );
  }
}
