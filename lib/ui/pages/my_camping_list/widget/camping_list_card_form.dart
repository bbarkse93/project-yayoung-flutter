import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/data/dto/request_dto/my_camping_list_request_dto.dart';
import 'package:team_project/ui/pages/my_camping_list/riverpod/riverpod_my_camping_list.dart';

class CampingListCardForm extends ConsumerWidget {
  const CampingListCardForm({
    Key? key,
    required this.myCampingDTO,
  }) : super(key: key);

  final MyCampingDTO myCampingDTO;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(myCampingListProvider.notifier).index;
    String campsite = myCampingDTO.campName;
    String campsiteAddress = myCampingDTO.campAddress;
    String startDate = myCampingDTO.checkInDate;
    String endDate = myCampingDTO.checkOutDate;
    String rating = myCampingDTO.totalRating;
    String campingImage = myCampingDTO.reviewImage;


    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(gapMain),
        image: DecorationImage(
          fit: BoxFit.cover, // 이미지가 컨테이너를 꽉 채우도록 설정
          image: NetworkImage('${campingImage}'), // 이미지 경로 설정
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: gapLarge, vertical: gapXLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '# ${index + 1}',
              style: subTitle2(mColor: kBackWhite),
            ),
            SizedBox(height: gapXSmall),
            Text(
              '${campsite}',
              style: title1(mColor: kBackWhite),
            ),
            SizedBox(height: gapXSmall),
            Text(
              '${campsiteAddress}',
              style: subTitle3(mColor: kBackWhite),
            ),
            SizedBox(height: gapXSmall),
            Text(
              '${startDate} - ${endDate}',
              style: subTitle3(mColor: kBackWhite),
            ),
            SizedBox(height: gapSmall),
            Row(
              children: List.generate(
                int.parse(rating),
                    (index) => iconFullStar(mColor: kBackWhite),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
