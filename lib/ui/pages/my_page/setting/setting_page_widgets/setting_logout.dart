import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/move.dart';
import 'package:team_project/_core/constants/size.dart';

class SettingLogout extends StatelessWidget {


  const SettingLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: gapMain,right: gapXSmall, bottom: gapMain),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("로그아웃", style: subTitle2(mFontWeight: FontWeight.w900),),
          IconButton(icon: iconArrowForward(mColor: kFormFieldBackground, mSize: 20),
            onPressed: () {_showAlertDialog(context);},)
        ],
      ),
    );
  }

  // 모달창 메서드
  Future<void> _showAlertDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: kBackWhite,
          title: Center(
            child: Column(
              children: [
                SizedBox(height: gapMain),
                Text("로그아웃 하시겠습니까?",
                  style: subTitle1(mColor: kBlack),
                ),
              ],
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('아니요',
                    style: subTitle1(mColor: kFontContent),
                  ),
                ),
                Container(
                  color: kFontContent,
                  height: gapLarge,
                  width: 1,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Move.refundPage);
                  },
                  child: Text("로그아웃",
                    style: subTitle1(mColor: kFontBrown, mFontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

}
