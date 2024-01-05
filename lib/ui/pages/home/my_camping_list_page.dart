import 'package:flutter/material.dart';
import 'package:team_project/ui/pages/home/widget/my_camping_list_page_appbar.dart';
import 'package:team_project/ui/pages/home/widget/my_camping_list_page_body.dart';

class MyCampingListPage extends StatefulWidget {
  const MyCampingListPage({super.key});

  @override
  State<MyCampingListPage> createState() => _MyCampingListPageState();
}

class _MyCampingListPageState extends State<MyCampingListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyCampingListPageAppBar(),
      body: MyCampingListPageBody(),
    );
  }
}
