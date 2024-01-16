import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:url_launcher/url_launcher.dart';


class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({Key? key}) : super(key: key);

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  List<String> imageList = [
    "assets/images/camping_record.png",
    "assets/images/camping_schedule.png",
    "assets/images/yay_carousel.png",
  ];

  List<String> siteUrls = [
    "https://www.naver.com",
    "https://www.google.com",
    "https://www.openai.com",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 350,
          child:sliderWidget(),
        ),
        SizedBox(height: gapMain),
        sliderIndicator(),
      ],
    );
  }
  Widget sliderWidget() {
    return CarouselSlider(
      carouselController: _controller,
      items: imageList.asMap().entries.map(
            (entry) {
          return Builder(
            builder: (context) {
              return InkWell(
                onTap: () async {
                  print("클릭됨?");
                  // onTap 이벤트를 처리하고, 각 이미지에 대한 URL을 열도록 합니다.
                  await launchUrl(Uri.parse(siteUrls[entry.key]));
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage(entry.value),
                  ),
                ),
              );
            },
          );
        },
      ).toList(),
      options: CarouselOptions(
        height: 320,
        viewportFraction: 1.0,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 4),
        onPageChanged: (index, reason) {
          setState(() {
            _current = index;
          });
        },
      ),
    );
  }

  Widget sliderIndicator() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imageList.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 12,
              height: 12,
              margin:
              const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                Colors.grey.withOpacity(_current == entry.key ? 0.9 : 0.4),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
