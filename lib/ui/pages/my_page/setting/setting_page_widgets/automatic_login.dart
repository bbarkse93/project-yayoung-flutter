import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';

class AutomaticLogin extends StatefulWidget {

  const AutomaticLogin({
   Key? key}) : super(key: key);

  @override
  _AutomaticLoginState createState() => _AutomaticLoginState();
}

class _AutomaticLoginState extends State<AutomaticLogin> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("자동 로그인", style: subTitle2(mFontWeight: FontWeight.w900),),
          InkWell(
            onTap: () {
            setState(() {
              isOn = !isOn;
            });
            },
              highlightColor: Colors.transparent, // 터치 효과 제거
              splashColor: Colors.transparent, // 터치 효과 제거
              child: isOn ? imageSettingOffButton(mWidth: 50, mHeight: 50) : imageSettingOnButton(mWidth: 50, mHeight: 50)),
        ],
      ),
    );
  }
}
