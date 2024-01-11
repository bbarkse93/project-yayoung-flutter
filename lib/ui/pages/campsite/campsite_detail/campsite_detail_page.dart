import 'package:flutter/material.dart';
import 'package:team_project/data/model/camp.dart';
import 'package:team_project/ui/pages/campsite/campsite_detail/campsite_detail_page_widgets/campsite_detail_page_body.dart';

class CampsiteDetailPage extends StatelessWidget {

  CampsiteDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:CampsiteDetailPageBody()
    );
  }
}
