import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_project/_core/constants/size.dart';
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
      child: ListView(
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
          ProviderScope(child: CampingListSlider()),
        ],
      ),
    );
  }
}


