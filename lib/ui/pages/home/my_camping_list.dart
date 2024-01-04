import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';

import 'widget/camping_list_slider.dart';

class MyCampingList extends StatefulWidget {
  const MyCampingList({super.key});

  @override
  State<MyCampingList> createState() => _MyCampingListState();
}

class _MyCampingListState extends State<MyCampingList> {
  int? selectedYear; // 선택된 년도
  int? selectedMonth; // 선택된 월
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackWhite,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: iconArrowBack()),
        title: Text(
          "내 캠핑장",
          style: title1(),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: gapMain),
        child: ListView(
          children: [
            SizedBox(height: gapLarge),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(gapSmall),
                      border: Border.all(color: kFontGray)),
                  height: 40,
                  width: 80,
                  child: Center(
                    child: DropdownButton<int>(
                      value: selectedYear,
                      onChanged: (int? newValue) {
                        setState(() {
                          selectedYear = newValue;
                        });
                      },
                      items: List.generate(
                        100,
                        (index) => DropdownMenuItem<int>(
                          value: 2010 + index,
                          child: Text((2010 + index).toString()),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: gapMain),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(gapSmall),
                      border: Border.all(color: kFontGray)),
                  height: 40,
                  width: 60,
                  child: Center(
                    child: DropdownButton<int>(
                      value: selectedMonth,
                      onChanged: (int? newValue) {
                        setState(() {
                          selectedMonth = newValue;
                        });
                      },
                      items: List.generate(
                        12,
                        (index) => DropdownMenuItem<int>(
                          value: index + 1,
                          child: Text((index + 1).toString()),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: gapXLarge),
            CampingListSlider(),
          ],
        ),
      ),
    );
  }
}
