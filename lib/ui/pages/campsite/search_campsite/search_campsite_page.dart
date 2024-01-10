import 'package:flutter/material.dart';
import 'package:team_project/ui/pages/campsite/search_campsite/search_campsite_page_widgets/search_campsite_appbar.dart';
import 'package:team_project/ui/pages/campsite/search_campsite/search_campsite_page_widgets/search_campsite_page_body.dart';

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
