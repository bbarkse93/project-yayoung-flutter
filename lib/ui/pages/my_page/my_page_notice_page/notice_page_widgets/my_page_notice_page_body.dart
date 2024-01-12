import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/data/mock/book_reply.dart';
import 'package:team_project/data/mock/faq.dart';
import 'package:team_project/data/mock/notice.dart';
import 'package:team_project/ui/pages/my_page/my_page_notice_page/notice_page_widgets/my_page_notice_category_button.dart';
import 'package:team_project/ui/pages/my_page/my_page_notice_page/notice_page_widgets/my_page_notice_description.dart';
import 'package:team_project/ui/pages/my_page/my_page_notice_page/notice_page_widgets/my_page_notice_detail.dart';
import 'package:team_project/ui/pages/my_page/my_page_notice_page/notice_page_widgets/my_page_notice_view_model/my_page_faq_view_model.dart';
import 'package:team_project/ui/pages/my_page/my_page_notice_page/notice_page_widgets/my_page_notice_view_model/my_page_notice_view_model.dart';


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
                    Consumer(builder: (context, ref, child){
                      FaqModel? model = ref.watch(faqProvider);
                      if (model == null) {
                        return SliverToBoxAdapter(child: CircularProgressIndicator());
                      }

                      return SliverFillRemaining(
                        child: IndexedStack(
                          index: _pageIndex,
                          children: [
                            /// 결제/환불
                            ListView.builder(
                              itemCount: model!.paymentDTOList!.length,
                              itemBuilder: (BuildContext context, int index) {
                                PaymentDTO paymentDTOList = model.paymentDTOList![index];
                                return NoticeDescription(
                                    title: "${paymentDTOList.title}",
                                    description: "${paymentDTOList.content}");
                              },
                            ),

                            /// 회원/비회원
                            ListView.builder(
                              itemCount: bookReplys.length,
                              itemBuilder: (BuildContext context, int index) {
                                UserDTO userDTOList = model.userDTOList![index];
                                return NoticeDescription(
                                    title: "${userDTOList.title}",
                                    description: "${userDTOList.content}");
                              },
                            ),
                          ],
                        ),
                      );
                    },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),

        // 공지사항 탭
        Consumer(
          builder: (context, ref, child) {
            NoticeModel? model = ref.watch(noticeProvider);
            if (model == null) {
              return CircularProgressIndicator();
            }
            return ListView.builder(
              itemCount: model!.noticeDTOList!.length,
              itemBuilder: (BuildContext context, int index) {
                NoticeDTO noticeDTOList = model.noticeDTOList![index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: gapMain),
                  child: NoticeDetail(
                      noticeTitle: "${noticeDTOList.title}",
                      noticeDate: "${noticeDTOList.createdAt}",
                      noticeComent: "${noticeDTOList.content}"),
                );
              },
            );
          }
        ),
      ],
    );
  }
}
