import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/size.dart';

class SelectYearButton extends StatefulWidget {
  const SelectYearButton({super.key});

  @override
  State<SelectYearButton> createState() => _SelectYearButtonState();
}

class _SelectYearButtonState extends State<SelectYearButton> {
  @override
  // 선택된 년도
  int? selectedYear;

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(gapSmall),
        border: Border.all(color: kFontGray),
      ),
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
            10,
                (index) => DropdownMenuItem<int>(
              value: 2020 + index,
              child: Text((2020 + index).toString()),
            ),
          ),
        ),
      ),
    );
  }
}