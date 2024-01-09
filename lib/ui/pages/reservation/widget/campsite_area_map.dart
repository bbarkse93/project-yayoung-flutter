import 'package:flutter/material.dart';

class CampsiteAreaMap extends StatelessWidget {
  const CampsiteAreaMap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/campsite_area1.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
