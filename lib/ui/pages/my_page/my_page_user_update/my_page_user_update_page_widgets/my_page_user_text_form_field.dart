import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';

class UserTextFormField extends StatefulWidget {
  final String title;
  final String nickName;
  final TextEditingController controller;

  const UserTextFormField({
    Key? key, required this.title, required this.controller, required this.nickName,
  }) : super(key: key);

  @override
  State<UserTextFormField> createState() => _UserTextFormFieldState();
}

class _UserTextFormFieldState extends State<UserTextFormField> {

 // TextEditingController _textController = TextEditingController();
  @override
  void dispose() {
    widget.controller.dispose(); // 컨트롤러를 해제합니다.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO 언약 : sessionUser.user!.nickname;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
              alignment: Alignment.centerLeft,
              child: Text(widget.title, style: bodyBlack1(mColor: kChoiceGray, mFontWeight: FontWeight.w900))),
          TextFormField(
            style: subTitle1(mFontWeight: FontWeight.w600),
            controller: widget.controller,
            decoration: InputDecoration(
              hintStyle: subTitle1(mFontWeight: FontWeight.w600),
              hintText: widget.nickName,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              suffix: InkWell(onTap: (){
                widget.controller.clear();
              }
                  ,child: iconChattingClose(mColor: kChoiceGray, mSize: 20)),
              // suffixIcon: ,
              prefixStyle: TextStyle(color: Colors.black), // 기본 데이터의 스타일
            ),

          ),
        ],
      )
    );
  }
}

