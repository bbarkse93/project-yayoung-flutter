import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/size.dart';

class PaymentSuccessButton extends StatelessWidget {
  const PaymentSuccessButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.7, // 원하는 비율로 조절
        child: InkWell(
          onTap: () {},
          child: Container(
            height: 60,
            decoration: BoxDecoration(
                color: kPrimaryColor, borderRadius: BorderRadius.circular(gapSmall)),
            child: Center(
              child: Text(
                "내 캠핑장",
                style: subTitle1(mColor: kBackWhite),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
