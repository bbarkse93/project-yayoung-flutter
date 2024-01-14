import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/data/model/camp.dart';
import 'package:team_project/data/model/campsite_detail.dart';

class CampsiteDetailHeader extends StatelessWidget {
  CampsiteDetail campInfo;

  CampsiteDetailHeader({Key? key, required this.campInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      leading: InkWell(
        child: iconArrowBack(mColor: kFontGray),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      expandedHeight: 400.0,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return FlexibleSpaceBar(
            title: constraints.biggest.height > 95.0
                ? Stack(
                    children: [
                      Positioned(
                        bottom: 10.0,
                        left: 0.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${campInfo.campName}",
                              style: TextStyle(fontSize: fontLarge),
                            ),
                            Text(
                              "${campInfo.campAddress}",
                              style: TextStyle(fontSize: fontSmall),
                            ),
                            Text(
                              "₩${campInfo.minPrice} ~ ${campInfo.maxPrice}",
                              style: TextStyle(fontSize: fontSmall),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : SafeArea(
                    child: SizedBox(
                      child: Row(
                        children: [
                          Spacer(),
                          Text(
                            "${campInfo.campName}",
                            style: TextStyle(
                                color: kFontTitle, fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Spacer(),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
            background: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.darken,
              ),
              child: PageView.builder(
                itemCount: campInfo.images?.length ?? 0,
                itemBuilder: (context, index) {
                  return Image.network(
                    "${dio.options.baseUrl}${campInfo.images?[index].campImage}",
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          );
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(gapMain),
          child: Row(
            children: [
              InkWell(
                child: iconLocation(mColor: kPrimaryColor),
                onTap: () {},
              ),
              SizedBox(width: gapXSmall),
              InkWell(
                child: iconBooking(mColor: kFontGray),
                onTap: () {},
              ),
              SizedBox(width: gapSmall),
              InkWell(
                child: iconEmptyHeart(mColor: kFontGray),
                onTap: () {},
              ),
            ],
          ),
        )
      ],
      pinned: true,
    );
  }
}
