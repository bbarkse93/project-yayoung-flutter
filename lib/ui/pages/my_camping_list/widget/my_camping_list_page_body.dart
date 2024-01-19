import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/data/model/my_camping.dart';
import 'package:team_project/ui/pages/my_camping_list/my_camping_list_view_model.dart';
import 'package:team_project/ui/pages/my_camping_list/widget/camping_list_slider.dart';
import 'package:team_project/ui/pages/my_camping_list/widget/select_year_button.dart';

class MyCampingListPageBody extends StatefulWidget {
  const MyCampingListPageBody({Key? key});

  @override
  State<MyCampingListPageBody> createState() => _MyCampingListPageBodyState();
}

class _MyCampingListPageBodyState extends State<MyCampingListPageBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: gapMain),
      child:
      Consumer(
        builder: (context, ref, child) {
          MyCampingListModel? model = ref.watch(myCampingListProvider);

          if (model == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          List<MyCamping> campingList = model!.campingList;

          if(campingList.isEmpty){
           return Container(
              height: getScreenHeight(context) * 1.0,
              width: getScreenWidth(context) * 1.0,
              child: imageMyCampingListPage(),
            );
          }

          return ListView(
            children: [
              SizedBox(height: gapLarge),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SelectYearButton(),
                  SizedBox(width: gapMain),
                ],
              ),
              SizedBox(height: gapXLarge),
              ProviderScope(child: CampingListSlider(campingList: campingList)),
            ],
          );
        },
      ),
    );
  }
}


