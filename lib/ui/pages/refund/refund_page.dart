import 'package:flutter/material.dart';
import 'package:team_project/ui/pages/refund/widget/refund_page_appbar.dart';
import 'package:team_project/ui/pages/refund/widget/refund_page_body.dart';

class RefundPage extends StatelessWidget {
  const RefundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RefundPageAppBar(),
      body: RefundPageBody(),
    );
  }
}


