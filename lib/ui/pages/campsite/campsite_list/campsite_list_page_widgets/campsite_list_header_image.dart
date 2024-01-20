import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CampsiteListHeaderImage extends StatelessWidget {
  final List<String> imageUrls = [
    "assets/images/banner/banner1.jpg",
    "assets/images/banner/banner2.jpg",
    "assets/images/banner/banner3.jpg",
    "assets/images/banner/banner4.jpg",
    "assets/images/banner/banner5.jpg",
    // Add more image URLs as needed
  ];

  CampsiteListHeaderImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: double.infinity,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.easeIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 1.0,
      ),
      items: imageUrls.map((url) {
        return Builder(
          builder: (BuildContext context) {
            return ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.darken,
              ),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(url),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}