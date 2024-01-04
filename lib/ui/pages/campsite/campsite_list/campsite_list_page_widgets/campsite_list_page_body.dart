import 'package:flutter/material.dart';
import 'package:team_project/ui/pages/campsite/campsite_list/campsite_list_page_widgets/campsite_list_core.dart';
import 'package:team_project/ui/pages/campsite/campsite_list/campsite_list_page_widgets/campsite_list_filter.dart';
import 'package:team_project/ui/pages/campsite/campsite_list/campsite_list_page_widgets/campsite_list_header.dart';

class CampsiteListPageBody extends StatelessWidget {
  const CampsiteListPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        CampsiteListHeader(),
        CampsiteListFilter(),
        // CampsiteListCore(),
      ],
    );
  }
}
