import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/ui/pages/campsite/campsite_list/campsite_list_page_widgets/campsite_list_page_body.dart';

class CampsiteListPage extends StatelessWidget {
  const CampsiteListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Scaffold(
        backgroundColor: kBackWhite,
        body: CampsiteListPageBody(),
      ),
    );
  }
}
