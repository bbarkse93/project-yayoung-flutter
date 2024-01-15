import 'package:flutter/material.dart';
import 'package:team_project/ui/pages/reservation/widget/reservation_page_appbar.dart';
import 'package:team_project/ui/pages/reservation/widget/reservation_page_body.dart';

class ReservationPage extends StatelessWidget {
  const ReservationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ReservationPageAppBar(campId: 1),
      ),
      body: ReservationPageBody(),
    );
  }
}
