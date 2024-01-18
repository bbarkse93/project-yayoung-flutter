import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/data/dto/user_request_dto.dart';
import 'package:team_project/data/store/session_user.dart';
import 'package:team_project/ui/pages/my_page/my_page_user_update/my_page_user_update_button.dart';
import 'package:team_project/ui/pages/my_page/my_page_user_update/my_page_user_update_page_widgets/my_page_user_pic.dart';
import 'package:team_project/ui/pages/my_page/my_page_user_update/my_page_user_update_page_widgets/my_page_user_text_form_field.dart';
import 'package:team_project/ui/pages/my_page/my_page_user_update/my_page_user_update_page_widgets/my_page_user_update_sign.dart';
import 'package:team_project/ui/pages/my_page/my_page_user_update/my_page_user_update_view_model.dart';
import 'package:team_project/ui/widgets/my_page_appbar.dart';


class UserUpdate extends ConsumerWidget {
  UserUpdate({super.key});

  final _formKey = GlobalKey<FormState>();
  final _nickName = TextEditingController();
  File? selectedImagePath;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserUpdateModel? model = ref.watch(userUpdateProvider);

    // 콜백 함수
    void updateImage(File imagePath) {
      Logger().d("선택된 이미지 경로 : $imagePath");
      if (imagePath == null) {
        selectedImagePath = null;
      }
        selectedImagePath = imagePath;

    }

    if (model == null) {
     return CircularProgressIndicator();
    }

    return Scaffold(
      backgroundColor: kBackWhite,
      appBar: MyPageAppbar(
          icon: iconArrowBack(mColor: kBlack, mSize: gapSemiMedium),
          title: "프로필",
          button: UserUpdateButton(
              funPageRoute: () async {
                if (_formKey.currentState!.validate()) {
                String base64Image1 = "";
                  if(selectedImagePath != null){
                    final bytes = File(selectedImagePath!.path).readAsBytesSync();
                    base64Image1 = base64Encode(bytes);
                  }

                Logger().d("인코딩 잘 됬나 ? ${base64Image1}");
                  UserUpdateReqDTO userUpdateReqDTO = UserUpdateReqDTO(
                      nickname: _nickName.text.isEmpty ? model.nickname : _nickName.text,
                  userImage: base64Image1.isEmpty ? model.userImage : base64Image1);
                  await ref.read(sessionStore).userUpdate(userUpdateReqDTO);
                  ref.read(userUpdateProvider.notifier).notifyInit();
                }
              },
              buttonText: "확인")),

      body: ListView(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: gapMediumLarge),
                UserUpdateSign(),
                UserPic(
                  imageUrl: model!.userImage,
                  updateImageCallback: updateImage,
                ),
                UserTextFormField(
                  title: "닉네임",
                  controller: _nickName,
                  nickName: model!.nickname,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




