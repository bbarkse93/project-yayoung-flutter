import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/move.dart';
import 'package:team_project/_core/constants/size.dart';

class CampsiteListHeader extends StatelessWidget {
  const CampsiteListHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      title: const Text("캠핑장",
          style:
              TextStyle(fontSize: fontSemiLarge, fontWeight: FontWeight.bold)),
      actions: [
        Padding(
          padding: const EdgeInsets.all(gapMain),
          child: InkWell(
            child: iconSearch(),
            onTap: () {
              Navigator.of(context).pushNamed(Move.searchCampsitePage);
            },
          ),
        )
      ],
      expandedHeight: 250,
      flexibleSpace: PageView.builder(
        scrollDirection: Axis.horizontal,
        // itemCount: product.productPics?.length,
        itemBuilder: (context, index) {
          return Image.network(
            "https://picsum.photos/200",
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
