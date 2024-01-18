import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/_core/constants/size.dart';

class UserPic extends StatefulWidget {
  final String? imageUrl;
  final void Function(File) updateImageCallback;

  const UserPic({Key? key, required this.imageUrl, required this.updateImageCallback}) : super(key: key);

  @override
  State<UserPic> createState() => _UserPicState();
}

class _UserPicState extends State<UserPic> {
  File? _image; //이미지를 담을 변수 선언



  final ImagePicker picker = ImagePicker(); //ImagePicker 초기화

  //이미지를 가져오는 함수
  Future getImage(ImageSource imageSource) async {

    //pickedFile에 ImagePicker로 가져온 이미지가 담긴다.
    final XFile? pickedFile = await picker.pickImage(source: imageSource);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); //가져온 이미지를 _image에 저장
        widget.updateImageCallback(_image!);
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
            _image!,
            width: double.infinity, // 부모의 가로 크기에 맞추기
            height: double.infinity, // 부모의 세로 크기에 맞추기
            fit: BoxFit.cover, // 이미지를 가득 채우도록 설정
          ),
        ),
      ),
    )
        : Container(
        width: getScreenWidth(context) * 0.8,
        height: getScreenHeight(context) * 0.4,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20), // 테두리 둥근 정도 결정
            child: InkWell(
                onTap: () {
                  getImage(ImageSource.gallery);
                },
              child: widget.imageUrl != null && widget.imageUrl!.startsWith("/images/user/")
                  ? Image.network("${dio.options.baseUrl}${widget.imageUrl}", width: getScreenWidth(context) * 0.8, height: getScreenHeight(context) * 0.4, fit: BoxFit.cover,)
                  : Image.network("${widget.imageUrl}", fit: BoxFit.cover,)
              //  Image.network(widget.imageUrl)
            ))
               // Image.asset(imageUrl)))

    );
  }
}
