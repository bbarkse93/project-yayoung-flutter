import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/size.dart';

class HomepageClickButton extends StatelessWidget {
  const HomepageClickButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: gapLarge),
        Container(
          width: 70,
          height: 20,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.grey, // 버튼의 배경색
            borderRadius: BorderRadius.circular(20), // 둥근 테두리 설정
          ),
          child: Text(
            'Click',
            style: TextStyle(
              color: Colors.white, // 글자의 색상
            ),
          ),
        ),
        SizedBox(height: gapMain),
      ],
    );
  }
}
