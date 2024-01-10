import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:team_project/_core/constants/size.dart';

class UserPic extends StatefulWidget {
  final Function(String?) onImageSelected;
  final String imageUrl;

  const UserPic({Key? key, required this.imageUrl, required this.onImageSelected}) : super(key: key);

  @override
  State<UserPic> createState() => _UserPicState();
}


class _UserPicState extends State<UserPic> {
  XFile? _image; //이미지를 담을 변수 선언
  final ImagePicker picker = ImagePicker(); //ImagePicker 초기화

  //이미지를 가져오는 함수
  Future getImage(ImageSource imageSource) async {
    //pickedFile에 ImagePicker로 가져온 이미지가 담긴다.
    final XFile? pickedFile = await picker.pickImage(source: imageSource);

    if (pickedFile != null) {
      setState(() {
        _image = XFile(pickedFile.path); //가져온 이미지를 _image에 저장
        widget.onImageSelected(pickedFile.path);

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(gapMain),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30, width: double.infinity),
            _buildPhotoArea(),
            SizedBox(height: 20),
      ]
        ),
    );
  }

  Widget _buildPhotoArea() {
    return _image != null
        ? Container(
      width: 300,
      height: 300,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: (){
            getImage(ImageSource.gallery);
          },
          child: Image.file(
            File(_image!.path),
            width: double.infinity, // 부모의 가로 크기에 맞추기
            height: double.infinity, // 부모의 세로 크기에 맞추기
            fit: BoxFit.cover, // 이미지를 가득 채우도록 설정
          ),
        ),
      ),
    )
        : Container(
        width: 300,
        height: 300,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20), // 테두리 둥근 정도 결정
            // TODO 언약: 이미지 매겨변수 받기
            child: InkWell(
                onTap: () {
                  getImage(ImageSource.gallery);
                },
                child: Image.asset("assets/images/profile.jpg")))
               // Image.asset(imageUrl)))

    );
  }
}
