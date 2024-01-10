import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/move.dart';
import 'package:team_project/_core/constants/size.dart';

class MyPageProfile extends StatelessWidget {
  const MyPageProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(gapMain),
      child: Row(
        children: [
          SizedBox(
              height: 75,
              width: 75,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8), // 테두리 둥근 정도 결정
                  // TODO 언약: 이미지 매겨변수 받기
                  child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Move.userUpdatePage);
                      },child: Image.asset("assets/images/profile.jpg")))
          ),
          SizedBox(
            width: 18,
          )
          ,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("디자이너스", style: title2()),
          )
        ],
      ),
    );
  }
}
