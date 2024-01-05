import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';

class UserTextFormField extends StatelessWidget {
  const UserTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          Text("닉네임", style: bodyBlack1(mColor: kChoiceGray, mFontWeight: FontWeight.w900)),
          TextFormField(
            decoration: InputDecoration(
              hintText: "디자이너스",
              hintStyle: subTitle1(mFontWeight: FontWeight.w600),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              suffix: InkWell(onTap: (){

              }
                  ,child: iconChattingClose(mColor: kChoiceGray,mSize: 20)),
              // suffixIcon: ,
              prefixStyle: TextStyle(color: Colors.black), // 기본 데이터의 스타일
            ),
            onSaved: (String? value) {
              Logger().d("업데이트 값 잘 받아올 까? : ${value}");
            },

          ),
        ],
      ),
    );
  }
}
