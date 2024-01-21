import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:team_project/data/model/my_camping.dart';
import 'package:team_project/ui/pages/my_camping_list/my_camping_list_page_widgets/camping_list_card_form.dart';

class CampingListSlider extends StatefulWidget {
  final List<MyCamping> campingList;

  const CampingListSlider({Key? key, required this.campingList}) : super(key: key);


  @override
  State<CampingListSlider> createState() => _CampingListSliderState();
}

class _CampingListSliderState extends State<CampingListSlider> {
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    print("CampingListSlider rebuilt");

        return CarouselSlider.builder(
          carouselController: carouselController,
          itemCount: widget.campingList?.length, // null이면 0으로 설정
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return Builder(
              builder: (BuildContext context) {
                return CampingListCardForm(index: index);
              },
            );
          },
          options: CarouselOptions(
            height: 450,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: false,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 100),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {},
            scrollDirection: Axis.horizontal,
          ),
        );
  }
}
