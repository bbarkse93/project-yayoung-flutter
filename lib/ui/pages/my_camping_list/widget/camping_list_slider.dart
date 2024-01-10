import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/data/dto/request_dto/my_camping_list_request_dto.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/mock/camping_record.dart';
import 'package:team_project/ui/pages/my_camping_list/widget/camping_list_card_form.dart';

class CampingListSlider extends StatefulWidget {
  const CampingListSlider({Key? key}) : super(key: key);

  @override
  State<CampingListSlider> createState() => _CampingListSliderState();
}

class _CampingListSliderState extends State<CampingListSlider> {
  CarouselController carouselController = CarouselController();
  List<MyCampingDTO>? campingListDTOs; // nullable로 변경

  @override
  void initState() {
    super.initState();
    fetchMyCampingList(); // 데이터 가져오기
  }

  Future<void> fetchMyCampingList() async {
    try {
      Response response = await dio.get(
        "/camp/myCamp",
      );
      Logger().d(response);
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      // 데이터를 가져와서 상태를 업데이트합니다.
      setState(() {
        campingListDTOs = myCampingListDTO(responseDTO.response);
      });
    } catch (error) {
      // 에러 처리
      print("데이터를 가져오는 중 오류 발생: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (campingListDTOs == null) {
      // 데이터가 로드되기 전에 로딩 화면 또는 플레이스홀더를 표시할 수 있습니다.
      return CircularProgressIndicator();
    } else {
      return CarouselSlider.builder(
        carouselController: carouselController,
        itemCount: campingListDTOs!.length,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          final record = campingListDTOs![index];

          return Builder(
            builder: (BuildContext context) {
              return CampingListCardForm(myCampingDTO: record);
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
}
