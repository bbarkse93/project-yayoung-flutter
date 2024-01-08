import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/pages/my_camping_list/widget/camping_list_slider.dart';
import 'package:team_project/ui/pages/my_camping_list/widget/select_year_button.dart';

class MyCampingListPageBody extends StatefulWidget {
  const MyCampingListPageBody({super.key});

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
          const SizedBox(height: gapLarge),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SelectYearButton(),
              const SizedBox(width: gapMain),
            ],
          ),
          const SizedBox(height: gapXLarge),
          CampingListSlider(),
        ],
      ),
    );
  }
}


