import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/data/mock/book_reply.dart';
import 'package:team_project/data/mock/faq.dart';
import 'package:team_project/data/mock/notice.dart';
import 'package:team_project/ui/pages/my_page/notice_page/notice_page_widgets/notice_category_button.dart';
import 'package:team_project/ui/pages/my_page/notice_page/notice_page_widgets/notice_description.dart';
import 'package:team_project/ui/pages/my_page/notice_page/notice_page_widgets/notice_detail.dart';

class NoticePageBody extends StatefulWidget {
  const NoticePageBody({
    Key? key,
  });

  @override
  State<NoticePageBody> createState() => _NoticePageBodyState();
}

class _NoticePageBodyState extends State<NoticePageBody> {
  int _pageIndex = 0;

  void changePage(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        // FAQ 탭
        Padding(
          padding: const EdgeInsets.all(gapMain),
          child: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: gapSemiMedium),
                        child: Container(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              NoticeCategoryButton(
                                label: "결제/환불",
                                index: 0,
                                pageIndex: _pageIndex,
                                fontWeight: FontWeight.bold,
                                onPress: () {
                                  changePage(0);
                                },
                                icon: iconRefund(),
                              ),
                              NoticeCategoryButton(
                                label: "회원/비회원",
                                index: 1,
                                pageIndex: _pageIndex,
                                fontWeight: FontWeight.bold,
                                onPress: () {
                                  changePage(1);
                                },
                                icon: iconBottomSetting(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverFillRemaining(
                      child: IndexedStack(
                        index: _pageIndex,
                        children: [
                          /// 결제/환불
                          ListView.builder(
                            itemCount: paymentFAQ.length,
                            itemBuilder: (BuildContext context, int index) {
                              return NoticeDescription(
                                  title: "${paymentFAQ[index].subTitle}",
                                  description: "${paymentFAQ[index].content}");
                            },
                          ),

                          /// 회원/비회원
                          ListView.builder(
                            itemCount: bookReplys.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  NoticeDescription(
                                      title: "${userFAQ[index].subTitle}",
                                      description: "${userFAQ[index].content}"),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),

        // 공지사항 탭
        ListView.builder(
          itemCount: noticeList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: gapMain),
              child: NoticeDetail(
                  noticeTitle: "${noticeList[index].subTitle}",
                  noticeDate: "${noticeList[index].createdAt}",
                  noticeComent: "${noticeList[index].content}"),
            );
          },
        ),
      ],
    );
  }
}
