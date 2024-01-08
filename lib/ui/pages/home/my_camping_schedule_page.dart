import 'package:flutter/material.dart';
import 'package:team_project/ui/pages/home/widget/my_camping_schedule_page_body.dart';

import 'widget/my_camping_schedule_page_appbar.dart';

class MyCampingSchedulePage extends StatelessWidget {
  const MyCampingSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCampingSchedulePageAppBar(),
      body: MyCampingSchedulePageBody(),
    );
  }
}


