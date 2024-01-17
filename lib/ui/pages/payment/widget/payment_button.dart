import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/size.dart';

class PaymentButton extends StatelessWidget {
  const PaymentButton({
    Key? key,
    required this.onPressed,
    required this.isChecked1,
    required this.isChecked2,
  }) : super(key: key);

  final VoidCallback onPressed;
  final bool isChecked1;
  final bool isChecked2;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.7,
        child: InkWell(
          onTap: () {
            if (isChecked1 && isChecked2) {
              // 약관 동의가 모두 선택된 경우에만 onPressed 로직 추가
              onPressed();
            } else {
              // 약관 동의가 하나라도 선택되지 않은 경우 스낵바 표시
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('약관에 동의해주세요.'),
                  duration: Duration(seconds: 2),
                  action: SnackBarAction(
                    label: '확인',
                    onPressed: () {
                      // 스낵바 액션을 클릭할 때의 동작 추가
                    },
                  ),
                ),
              );
            }
          },
          child: Container(
            height: 60,
            decoration: BoxDecoration(
                color: kKakaoColor, borderRadius: BorderRadius.circular(gapSmall)),
            child: Center(
              child: Text(
                "카카오 페이로 결제하기",
                style: subTitle1(mColor: kBackWhite),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
