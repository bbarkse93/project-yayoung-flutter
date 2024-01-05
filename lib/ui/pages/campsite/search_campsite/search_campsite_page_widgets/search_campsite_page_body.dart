import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/size.dart';

class SearchCampsitePageBody extends StatelessWidget {
  const SearchCampsitePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kSubColor
      ),
      child: ListView(
        children: [
          ListTile(
            title: Text("안녕",style: TextStyle(fontSize: fontLarge,fontWeight: FontWeight.bold),),
            subtitle: Text("만나서 반가워", style: TextStyle(fontSize: fontSemiMedium),),
            onTap: () {
              print("1번");
            },
          ),
          ListTile(
            title: Text("안녕",style: TextStyle(fontSize: fontLarge,fontWeight: FontWeight.bold),),
            subtitle: Text("만나서 반가워", style: TextStyle(fontSize: fontSemiMedium),),
            onTap: () {
              print("2번");
            },
          ),
          ListTile(
            title: Text("안녕",style: TextStyle(fontSize: fontLarge,fontWeight: FontWeight.bold),),
            subtitle: Text("만나서 반가워", style: TextStyle(fontSize: fontSemiMedium),),
            onTap: () {
              print("3번");
            },
          ),
          ListTile(
            title: Text("안녕",style: TextStyle(fontSize: fontLarge,fontWeight: FontWeight.bold),),
            subtitle: Text("만나서 반가워", style: TextStyle(fontSize: fontSemiMedium),),
            onTap: () {
              print("4번");
            },
          ),
          ListTile(
            title: Text("안녕",style: TextStyle(fontSize: fontLarge,fontWeight: FontWeight.bold),),
            subtitle: Text("만나서 반가워", style: TextStyle(fontSize: fontSemiMedium),),
            onTap: () {
              print("5번");
            },
          ),
          ListTile(
            title: Text("안녕",style: TextStyle(fontSize: fontLarge,fontWeight: FontWeight.bold),),
            subtitle: Text("만나서 반가워", style: TextStyle(fontSize: fontSemiMedium),),
            onTap: () {
              print("6번");
            },
          ),
          ListTile(
            title: Text("안녕",style: TextStyle(fontSize: fontLarge,fontWeight: FontWeight.bold),),
            subtitle: Text("만나서 반가워", style: TextStyle(fontSize: fontSemiMedium),),
            onTap: () {},
          ),
          ListTile(
            title: Text("안녕",style: TextStyle(fontSize: fontLarge,fontWeight: FontWeight.bold),),
            subtitle: Text("만나서 반가워", style: TextStyle(fontSize: fontSemiMedium),),
            onTap: () {},
          ),
          ListTile(
            title: Text("안녕",style: TextStyle(fontSize: fontLarge,fontWeight: FontWeight.bold),),
            subtitle: Text("만나서 반가워", style: TextStyle(fontSize: fontSemiMedium),),
            onTap: () {},
          ),
          ListTile(
            title: Text("안녕",style: TextStyle(fontSize: fontLarge,fontWeight: FontWeight.bold),),
            subtitle: Text("만나서 반가워", style: TextStyle(fontSize: fontSemiMedium),),
            onTap: () {},
          ),
          ListTile(
            title: Text("안녕",style: TextStyle(fontSize: fontLarge,fontWeight: FontWeight.bold),),
            subtitle: Text("만나서 반가워", style: TextStyle(fontSize: fontSemiMedium),),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
