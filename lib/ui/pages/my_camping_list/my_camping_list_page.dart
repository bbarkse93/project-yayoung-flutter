import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/ui/pages/my_camping_list/my_camping_list_page_widgets/my_camping_list_page_appbar.dart';
import 'package:team_project/ui/pages/my_camping_list/my_camping_list_page_widgets/my_camping_list_page_body.dart';

class MyCampingListPage extends StatelessWidget {
  const MyCampingListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackWhite,
      appBar: MyCampingListPageAppBar(),
      body: MyCampingListPageBody(),
    );
  }
}
