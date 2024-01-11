import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/data/model/camp.dart';
import 'package:team_project/data/model/campsite_detail.dart';

class CampsiteDetailHeader extends StatelessWidget {
  CampInfo campInfo;

  CampsiteDetailHeader({Key? key, required this.campInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      leading: InkWell(
        child: iconArrowBack(),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      expandedHeight: 400.0,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return constraints.biggest.height > 100.0
              ? SizedBox(
                  width: double.infinity,
                  child: FlexibleSpaceBar(
                    title: Stack(
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
                              Text("₩${campInfo.campPrice?.minPrice} ~ ${campInfo.campPrice?.maxPrice}",
                                // "₩${camp.minPrice} ~ ${camp.maxPrice}",
                                style: TextStyle(fontSize: fontSmall),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    background: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.darken),
                      child: Image.network(
                        "${dio.options.baseUrl}${campInfo.campFieldImage}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              : const FlexibleSpaceBar(
                  title: SafeArea(
                    child: Row(
                      children: [
                        Spacer(),
                        Text(
                          "",
                          style: TextStyle(color: kFontTitle),
                        ),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                      ],
                    ),
                  ),
                );
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(gapMain),
          child: iconEmptyHeart(),
        )
      ],
      pinned: true,
    );
  }
}
