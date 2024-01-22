import 'package:flutter/material.dart';
import 'package:team_project/ui/pages/home/home_page_widgets/home_page_appbar.dart';
import 'package:team_project/ui/pages/home/home_page_widgets/home_page_body.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomePageAppBar(),
      body: HomePageBody(),
    );
  }
}


