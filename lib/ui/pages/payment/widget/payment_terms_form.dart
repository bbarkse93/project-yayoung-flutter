import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/size.dart';

class PaymentTermsForm extends StatefulWidget {
  @override
  _PaymentTermsFormState createState() => _PaymentTermsFormState();
}

class _PaymentTermsFormState extends State<PaymentTermsForm> {
  bool isAllChecked = false;
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;

  void updateAllCheckBox(bool? newValue) {
    if (newValue != null) {
      setState(() {
        isAllChecked = newValue;
        isChecked1 = newValue;
        isChecked2 = newValue;
        isChecked3 = newValue;
      });
    }
  }

  void updateSubCheckBox(int index, bool newValue) {
    setState(() {
      switch (index) {
        case 0:
          isChecked1 = newValue;
          break;
        case 1:
          isChecked2 = newValue;
          break;
        case 2:
          isChecked3 = newValue;
          break;
      }
      isAllChecked = isChecked1 && isChecked2 && isChecked3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity, // 레이아웃의 가로 공간을 다 사용
          height: 170, // 원하는 높이
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(gapMedium),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: isAllChecked,
                      onChanged: updateAllCheckBox,
                      activeColor: kPrimaryColor,
                    ),
                    Text(
                      '전체 동의하기',
                      style: subTitle2(mColor: Colors.grey),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: gapMain),
                  child: Container(
                    width: double.infinity,
                    height: 0.5,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: isChecked1 ?? false,
                          onChanged: (value) {
                            updateSubCheckBox(0, value ?? false);
                          },
                          activeColor: kPrimaryColor,
                        ),
                        Text(
                          '[필수] 개인정보 처리방침 동의',
                          style: subTitle3(mColor: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "보기",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: kButtonGray,
                              color: kButtonGray),
                        ),
                        SizedBox(width: gapMain),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Checkbox(
                          value: isChecked2,
                          onChanged: (value) {
                            updateSubCheckBox(1, value ?? false);
                          },
                          activeColor: kPrimaryColor,
                        ),
                        Text(
                          '[필수] 가격, 내용 등 상품 정보에 대한\n'
                          '정기 구독 안내 확인 동의',
                          // Add other style configurations as needed
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "보기",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: kButtonGray,
                            color: kButtonGray,
                          ),
                        ),
                        SizedBox(width: gapMain),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
