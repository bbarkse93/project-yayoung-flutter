import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/pages/campsite/search_campsite/search_campsite_page_widgets/search_campsite_page_body.dart';
import 'package:team_project/ui/pages/campsite/search_campsite/search_campsite_view_model.dart';

class CustomSearchFormField extends ConsumerStatefulWidget {
  const CustomSearchFormField({Key? key}) : super(key: key);

  @override
  ConsumerState<CustomSearchFormField> createState() =>
      _CustomSearchFormFieldState();
}

class _CustomSearchFormFieldState extends ConsumerState<CustomSearchFormField> {

  @override
  Widget build(BuildContext context) {
    final searchViewModel = ref.watch(searchProvider.notifier);
    return Expanded(
      child: SizedBox(
        height: gapSemiLarge,
        child: TextFormField(
          onChanged: (value) {
            ref.read(searchProvider.notifier).updateSearchKeyword(value);
            ref.read(searchProvider.notifier).campSearch();
            Logger().d("value = $value");
          },
          style: TextStyle(fontSize: fontMedium),
          decoration: InputDecoration(
            fillColor: kBackLightGray,
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
            suffixIcon: InkWell(
              child: iconSearch(mColor: kFontContent),
              onTap: () {
                ref.read(searchProvider.notifier).campSearch();
              },
            ),
          ),
          // onChanged: (value) {
          //   setState(() {
          //     Logger().d("searchController = $value");
          //   });
          // },
        ),
      ),
    );
  }
}
