import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/_core/constants/move.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/data/store/session_user.dart';
import 'package:team_project/ui/pages/my_page/my_page_user_update/my_page_user_update_view_model.dart';

class MyPageProfile extends ConsumerWidget {
  const MyPageProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserUpdateModel? model = ref.watch(userUpdateProvider.notifier).state;
    if (model == null) {
      return
        Center(
          child: CircularProgressIndicator(),
        );
    }
    
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
                      },child:
                        model?.userImage != null && model.userImage.startsWith("/images/user/")
                      ? Image.network("${dio.options.baseUrl}${model?.userImage}", width: getScreenWidth(context) * 0.8, height: getScreenHeight(context) * 0.4, fit: BoxFit.cover,)
                      : Image.network("${model?.userImage}", fit: BoxFit.cover,)
                  ))
          ),
          SizedBox(
            width: 18,
          )
          ,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(model!.nickname, style: title2()),
          )
        ],
      ),
    );
  }
}
