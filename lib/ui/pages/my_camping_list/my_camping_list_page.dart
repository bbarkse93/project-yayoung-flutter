import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/ui/pages/my_camping_list/widget/my_camping_list_page_appbar.dart';
import 'package:team_project/ui/pages/my_camping_list/widget/my_camping_list_page_body.dart';

class MyCampingListPage extends StatefulWidget {
  const MyCampingListPage({super.key});

  @override
  State<MyCampingListPage> createState() => _MyCampingListPageState();
}

class _MyCampingListPageState extends State<MyCampingListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackWhite,
      appBar: const MyCampingListPageAppBar(),
      body: MyCampingListPageBody(),
    );
  }
}
