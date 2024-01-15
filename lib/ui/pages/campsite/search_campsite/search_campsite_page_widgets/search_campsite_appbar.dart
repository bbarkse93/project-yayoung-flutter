import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/ui/widgets/custom_search_form_field.dart';

class SearchCampsiteAppbar extends StatelessWidget implements PreferredSizeWidget {
  const SearchCampsiteAppbar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      backgroundColor: kBackWhite,
      title: Row(
        children: [
          InkWell(
            child: iconArrowBack(mColor: kBlack),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          CustomSearchFormField(),
        ],
      ),
    );
  }
}
