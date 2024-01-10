import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/ui/pages/my_page/notice_page/notice_page_widgets/notice_page_body.dart';
import 'package:team_project/ui/pages/my_page/notice_page/notice_page_widgets/notice_appbar.dart';

class NoticePage extends StatelessWidget {
  const NoticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // 탭의 개수 설정 (현재는 FAQ 탭 하나)
      child: Scaffold(
        backgroundColor: kBackWhite,
        appBar: NoticeAppbar(),
        body: NoticePageBody(),
      ),
    );
  }
}

