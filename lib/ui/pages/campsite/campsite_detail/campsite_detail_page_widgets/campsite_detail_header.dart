import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';

class CampsiteDetailHeader extends StatelessWidget {
  const CampsiteDetailHeader({super.key});

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
                    title: const Stack(
                      children: [
                        Positioned(
                          bottom: 10.0,
                          left: 0.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "물가솔솔캠핑장",
                                style: TextStyle(fontSize: fontLarge),
                              ),
                              Text(
                                "강원 홍천군 내면 광원리 471-4",
                                style: TextStyle(fontSize: fontSmall),
                              ),
                              Text(
                                "₩45,000 ~ 55,000",
                                style: TextStyle(fontSize: fontSmall),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    background: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5),
                        BlendMode.darken
                      ),
                      child: Image.network(
                        "https://picsum.photos/200",
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
                          "물가 솔솔 캠핑장",
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
