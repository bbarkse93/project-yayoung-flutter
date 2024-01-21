import 'package:flutter/material.dart';
import 'package:team_project/ui/pages/refund/refund-page_widgets/refund_page_appbar.dart';
import 'package:team_project/ui/pages/refund/refund-page_widgets/refund_page_body.dart';

class RefundPage extends StatelessWidget {
  final int campId;
  final int orderId;

  const RefundPage({Key? key, required this.campId, required this.orderId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RefundPageAppBar(),
      body: RefundPageBody(campId: campId, orderId: orderId),
    );
  }
}
