import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/pages/review/review_page_widgets/review_bottom_sheet.dart';

class ReviewAppbar extends StatelessWidget implements PreferredSize{
  const ReviewAppbar({
    super.key,
  });
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget get child => throw UnimplementedError();


  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      backgroundColor: kBackWhite,
      leading: InkWell(
        child: iconArrowBack(),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: gapMain),
          child: InkWell(
            child: Container(
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(gapXSmall),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: gapSmall, vertical: gapSmall),
                child: Text(
                  "평가하기",
                  style: TextStyle(color: kBackWhite),
                ),
              ),
            ),
            onTap: () {
              _showBottomSheet(context);
            },
          ),
        )
      ],
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return ReviewBottomSheet();
      },
    );
  }


}

