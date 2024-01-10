import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  final double height;
  final double thickness;
  final Color color;

  MyDivider({required this.height, required this.thickness, required this.color});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      thickness: thickness,
      color: color,
    );
  }
}