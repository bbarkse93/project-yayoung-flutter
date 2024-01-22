import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/size.dart';

class RefundRuleForm extends StatelessWidget {
  const RefundRuleForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "환불내용",
            style: subTitle1(),
          ),
          Padding(
            padding: const EdgeInsets.all(gapSmall),
            child: Text(
              "당일 환불 불가, 2일 전 100% 환불",
              style: subTitle3(mFontWeight: FontWeight.normal),
            ),
          ),
          SizedBox(height: gapXLarge),
          Text(
            "환불규정",
            style: subTitle1(),
          ),
          Padding(
            padding: const EdgeInsets.all(gapSmall),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "1. 환불 규정은 입실일(체크인 일자) 기준으로 적용됩니다.",
                  style: subTitle3(mFontWeight: FontWeight.normal),
                ),
                Text(
                  "2. 취소 환불 규정은 숙박요금에 한해 적용됩니다.",
                  style: subTitle3(mFontWeight: FontWeight.normal),
                ),
                Text(
                  "입실(체크인)시각 이후(No show)에는 예약취소 및 환불이 불가능 합니다.",
                  style: subTitle3(mFontWeight: FontWeight.normal),
                ),
                Text(
                  "* No show란 : 사전 연락 없이 예약된 사이트를 이용하지 않는 것",
                  style: subTitle3(mFontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
