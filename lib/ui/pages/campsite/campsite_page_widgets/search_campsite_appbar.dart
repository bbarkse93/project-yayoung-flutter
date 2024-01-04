import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/ui/widgets/custom_search_form_field.dart';

class SearchCampsiteAppbar extends StatelessWidget implements PreferredSizeWidget {

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  const SearchCampsiteAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kBackWhite,
      title: Row(
        children: [
          InkWell(
            child: iconArrowBack(mColor: kBlack),
            onTap: () {},
          ),
          CustomSearchFormField(),
        ],
      ),
    );
  }
}
