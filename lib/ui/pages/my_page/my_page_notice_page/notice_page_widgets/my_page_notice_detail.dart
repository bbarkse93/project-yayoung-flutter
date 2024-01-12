import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/widgets/custom_thin_line.dart';

class NoticeDetail extends StatefulWidget {
  final noticeTitle;
  final noticeDate;
  final noticeComent;

  const NoticeDetail(
      {required this.noticeTitle,
        required this.noticeDate,
        required this.noticeComent});

  @override
  State<NoticeDetail> createState() =>
      _NoticeDetailState();
}

class _NoticeDetailState extends State<NoticeDetail> {
  bool isExpanded = false; // isExpanded 변수를 정의하고 초기값을 false로 설정

  void toggleExpansion() {
    setState(() {
      isExpanded = !isExpanded; // toggleExpansion 메서드를 정의하여 isExpanded 변수를 토글
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            toggleExpansion(); // 컨테이너를 탭하면 확장/축소 토글
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: gapMain),
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // 가로 정렬을 왼쪽으로 설정
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.black, // 테두리 색상 설정
                        width: 1.0, // 테두리 두께 설정
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: gapSmall, vertical: 3),
                      child: Text("공지"),
                    ),
                  ),
                  SizedBox(height: gapMedium),
                  Container(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start, // 가로 정렬을 왼쪽으로 설정
                      children: [
                        Text(widget.noticeTitle, style: subTitle2()),
                        SizedBox(height: gapMedium),
                        Text(widget.noticeDate,
                            style: bodyBlack2(mColor: kFontGray)),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  CustomThinLine(),
                ],
              ),
            ),
          ),
        ),
        if (isExpanded)
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  widget.noticeComent,
                  style: bodyBlack1(mFontWeight: FontWeight.w300),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 20),
                CustomThinLine(),
              ],
            ),
          ),
      ],
    );
  }
}