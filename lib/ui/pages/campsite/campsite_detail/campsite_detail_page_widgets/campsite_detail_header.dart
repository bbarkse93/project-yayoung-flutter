import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/move.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/data/model/camp.dart';
import 'package:team_project/data/model/campsite_detail.dart';
import 'package:team_project/ui/pages/campsite/campsite_detail/campsite_detail_view_model.dart';
import 'package:team_project/ui/pages/campsite/campsite_map/campsite_map_page.dart';

import '../../../../../data/dto/camp_request_dto.dart';

class CampsiteDetailHeader extends ConsumerWidget {
  CampsiteDetail campInfo;

  CampsiteDetailHeader({Key? key, required this.campInfo}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

      return SliverAppBar(
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      leading: InkWell(
        child: iconArrowBack(mColor: kFontGray),
        onTap: () {
          Navigator.popUntil(context, (route) => route.isFirst);
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CampsiteMapPage(initialAddress: "${campInfo.campAddress}"),
                    ),
                  );
                },
              ),
              SizedBox(width: gapXSmall),
              InkWell(
                child: iconBooking(mColor: kFontGray),
                onTap: () {},
              ),
              SizedBox(width: gapSmall),
              InkWell(
                child: campInfo.bookmark == false ? iconEmptyHeart(mColor: kFontGray) : iconFullHeart(mColor: kFontRed),
                onTap: () async {
                  CampSaveOrDeleteDTO requestDTO = CampSaveOrDeleteDTO(campInfo!.id!);
                  if(campInfo.bookmark == false){
                    ref.read(campsiteDetailProvider(campInfo!.id!).notifier).saveBookmark(requestDTO);
                  }else{
                    ref.read(campsiteDetailProvider(campInfo!.id!).notifier).deleteBookmark(requestDTO);
                  }
                },
              ),
            ],
          ),
        )
      ],
      pinned: true,
    );
  }
}
