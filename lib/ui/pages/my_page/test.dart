import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/icon.dart';



class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          imageBottomBarCamping(mColor: Colors.red),
          iconCity()

        ],
      ),
    );
  }
}
