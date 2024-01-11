import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_project/data/model/my_camping.dart';
import 'package:team_project/ui/pages/my_camping_list/my_camping_list_view_model.dart';
import 'package:team_project/ui/pages/my_camping_list/widget/camping_list_card_form.dart';

class CampingListSlider extends StatefulWidget {
  const CampingListSlider({Key? key}) : super(key: key);

  @override
  State<CampingListSlider> createState() => _CampingListSliderState();
}

class _CampingListSliderState extends State<CampingListSlider> {
  CarouselController carouselController = CarouselController();



  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        MyCampingListModel? model = ref.watch(myCampingListProvider);
        List<MyCamping> campingList = [];
        if (model == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return CarouselSlider.builder(
          carouselController: carouselController,
          itemCount: campingList.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {

            return Builder(
              builder: (BuildContext context) {
                int index = 0; // 사용하고자 하는 인덱스 값 설정
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
      },
    );
  }
}
