import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/pages/campsite/campsite_page_widgets/search_campsite_appbar.dart';
import 'package:team_project/ui/pages/campsite/campsite_page_widgets/search_campsite_page_body.dart';
import 'package:team_project/ui/widgets/custom_search_form_field.dart';

class SearchCampsitePage extends StatelessWidget {
  const SearchCampsitePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchCampsiteAppbar(),
      body: SearchCampsitePageBody(),
    );
  }
}


