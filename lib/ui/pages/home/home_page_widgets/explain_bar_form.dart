import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';

class ExplainBarForm extends StatelessWidget {
  final String symbol;
  final String title;
  final String subTitle;
  final String pageAddress;

  const ExplainBarForm({
    Key? key,
    required this.symbol,
    required this.title,
    required this.subTitle,
    required this.pageAddress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              child: Center(
                child: Text(
                  "${symbol}",
                  style: title1(mColor: Colors.white),
                ),
              ),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(gapSmall),
              ),
            ),
            SizedBox(width: gapMain),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${title}",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${subTitle}",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, pageAddress);
          },
          icon: iconArrowForward(),
        ),
      ],
    );
  }
}
