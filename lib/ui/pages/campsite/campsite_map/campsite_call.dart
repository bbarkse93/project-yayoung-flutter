import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CampsiteCall extends StatelessWidget {
  final String phoneNumber = 'tel:010-6295-4886';

  const CampsiteCall({super.key}); // 전화번호를 적절한 형식으로 입력하세요

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _launchPhoneCall(phoneNumber);
          },
          child: Text('전화 걸기'),
        ),
      ),
    );
  }

  _launchPhoneCall(String phoneNumber) async {
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      throw '전화를 걸 수 없습니다: $phoneNumber';
    }
  }
}