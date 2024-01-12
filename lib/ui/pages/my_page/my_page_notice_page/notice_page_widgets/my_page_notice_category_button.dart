import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/size.dart';

class NoticeCategoryButton extends StatelessWidget {
  final String label;
  final int index;
  final int pageIndex;
  final VoidCallback onPress;
  final FontWeight? fontWeight;
  final icon;
  const NoticeCategoryButton(
      {required this.label,
        required this.index,
        required this.pageIndex,
        required this.onPress,
        this.fontWeight,
        required this.icon});

  @override
  Widget build(BuildContext context) {
    bool isSelected = index == pageIndex;

    return TextButton(
      onPressed: () {
        onPress();
      },
      style: TextButton.styleFrom(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          backgroundColor: isSelected ? kBackBlack : kBackWhite,
          elevation: 5,
          minimumSize: Size(120, 50) // 선택한 상태에 따라 배경색 변경
      ),
      child: Row(
        children: [
          Icon(
            icon.icon,
            color: isSelected ? kBackWhite : kBackBlack, // 아이콘의 색상 변경
            size: 20,
          ),
          const SizedBox(width: gapSmall),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: isSelected ? kBackWhite : kBackBlack, // 선택한 상태에 따라 색상 변경
              fontWeight: isSelected
                  ? FontWeight.bold
                  : (fontWeight ?? FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}