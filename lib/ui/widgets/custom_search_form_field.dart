import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';

class CustomSearchFormField extends StatelessWidget {
  const CustomSearchFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: gapSemiLarge,
        child: TextFormField(
          style: TextStyle(fontSize: fontMedium),
          decoration: InputDecoration(
            fillColor: kChoiceGray,
            filled: true,
            contentPadding: EdgeInsets.symmetric(
              vertical: gapSmall,
              horizontal: gapSmall,
            ),
            hintText: "캠핑장 이름",
            hintStyle: TextStyle(
              color: kFontContent,
              fontSize: fontMedium,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: kBackLightGray),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: kBackLightGray),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: kBackLightGray),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: kBackLightGray),
            ),
            suffixIcon:InkWell(
              child: iconFullStar(mColor: kBlack),
              onTap: () {},
            ),
          ),
        ),
      ),
    );
  }
}
