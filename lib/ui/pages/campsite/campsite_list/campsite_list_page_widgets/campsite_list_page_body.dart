import 'package:flutter/material.dart';
import 'package:team_project/ui/pages/campsite/campsite_list/campsite_list_page_widgets/campsite_list_core.dart';
import 'package:team_project/ui/pages/campsite/campsite_list/campsite_list_page_widgets/campsite_list_filter.dart';
import 'package:team_project/ui/pages/campsite/campsite_list/campsite_list_page_widgets/campsite_list_header.dart';

class CampsiteListPageBody extends StatelessWidget {
  const CampsiteListPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CampsiteListHeader(),
        SliverPersistentHeader(
            delegate: CampsiteListFilterHeader(), pinned: true),
        CampsiteListCore(),
      ],
    );
  }
}

class CampsiteListFilterHeader extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 135.0; // Minimum height of the header

  @override
  double get maxExtent => 135.0; // Maximum height of the header when expanded

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return CampsiteListFilter();
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
