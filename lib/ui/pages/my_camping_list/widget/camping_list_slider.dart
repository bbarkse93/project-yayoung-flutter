import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:team_project/data/mock/camping_record.dart';
import 'package:team_project/ui/pages/my_camping_list/widget/camping_list_card_form.dart';

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
    return CarouselSlider.builder(
      // Set carousel controller
      carouselController: carouselController,
      itemCount: CampingRecordList.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        final record = CampingRecordList[index];

        return Builder(
          builder: (BuildContext context) {
            return CampingListCardForm(
              campingImage: record.campingImage,
              campsite: record.campsite,
              campsiteAddress: record.campsiteAddress,
              startDate: record.startDate,
              endDate: record.endDate,
              rating: record.rating,
              index: index,
            );
          },
        );
      },
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

