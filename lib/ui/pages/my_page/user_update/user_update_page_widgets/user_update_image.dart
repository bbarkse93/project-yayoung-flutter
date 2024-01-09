import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/size.dart';

// TODO 언약 : 이미지 클릭 시 갤러리 연결하기, 확인 누르면 수정 insert
class UserUpdateImage extends StatelessWidget {
  const UserUpdateImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(gapMain),
      child: Container(
        child: SizedBox(
            height: 300,
            width: 300,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20), // 테두리 둥근 정도 결정
                // TODO 언약: 이미지 매겨변수 받기
                child: InkWell(
                    onTap: () {},
                    child: Image.asset("assets/images/profile.jpg")))
        ),
      ),
    );
  }
}
