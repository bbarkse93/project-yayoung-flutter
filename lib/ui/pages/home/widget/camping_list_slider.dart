import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/size.dart';

class CampingListSlider extends StatefulWidget {
  const CampingListSlider({super.key});

  @override
  State<CampingListSlider> createState() => _CampingListSliderState();
}

class _CampingListSliderState extends State<CampingListSlider> {
  CarouselController carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      // Set carousel controller
      carouselController: carouselController,
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color: kButtonGray,
                  borderRadius: BorderRadius.circular(gapMain),
                ),
                child: Center(
                  child: Text(
                    'text $i',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ));
          },
        );
      }).toList(),
      options: CarouselOptions(
        height: 450,
        aspectRatio: 16 / 9,
        // 슬라이더 이미지 화면에 얼마나 보이는지
        viewportFraction: 0.8,
        // 시작 페이지
        initialPage: 0,
        // 무한스크롤
        enableInfiniteScroll: true,
        // 스크롤방향
        reverse: false,
        // 자동스크롤
        autoPlay: false,
        // 페이지 유지시간
        autoPlayInterval: const Duration(seconds: 5),
        // 넘김시간
        autoPlayAnimationDuration: const Duration(milliseconds: 100),
        // 넘김 애니메이션
        autoPlayCurve: Curves.fastOutSlowIn,
        // 현재페이지 중앙확대
        enlargeCenterPage: true,
        // 이건 좀 이해가 안됨
        onPageChanged: (index, reason) {},
        // 가로넘김
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
