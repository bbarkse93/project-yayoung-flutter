import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/data/dto/user_request_dto.dart';
import 'package:team_project/data/store/session_user.dart';
import 'package:team_project/ui/pages/my_page/user_update/user_update_button.dart';
import 'package:team_project/ui/pages/my_page/user_update/user_update_page_widgets/user_pic.dart';
import 'package:team_project/ui/pages/my_page/user_update/user_update_page_widgets/user_text_form_field.dart';
import 'package:team_project/ui/pages/my_page/user_update/user_update_view_model.dart';
import 'package:team_project/ui/widgets/my_page_appbar.dart';
import 'package:team_project/ui/pages/my_page/user_update/user_update_page_widgets/user_update_sign.dart';

class UserUpdate extends ConsumerWidget {
  UserUpdate({super.key});

  final _formKey = GlobalKey<FormState>();
  final _nickName = TextEditingController();
  final userPicUrl = ValueNotifier<String?>(null);


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    UserUpdateModel? model = ref.watch(userUpdateProvider);

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
                  UserUpdateReqDTO userUpdateReqDTO = UserUpdateReqDTO(
                      nickname: _nickName.text,
                  userImage: "테스트");
                  print('버튼 클릭됨 :' + userUpdateReqDTO.nickname);
                  print('버튼 클릭됨 :' + userUpdateReqDTO.userImage);
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
                UserPic(imageUrl: model!.userImage, onImageSelected: (imageUrl) {
                  userPicUrl.value = imageUrl;
                },
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




