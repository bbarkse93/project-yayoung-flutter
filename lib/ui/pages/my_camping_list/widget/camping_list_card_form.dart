import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/http.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/data/model/my_camping.dart';
import 'package:team_project/ui/pages/my_camping_list/my_camping_list_view_model.dart';

class CampingListCardForm extends ConsumerWidget {
  const CampingListCardForm({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MyCampingListModel? model = ref.watch(myCampingListProvider);
    List<MyCamping>? campingList = model?.campingList;

    if (campingList == null) {
      return Center(child: Text('캠핑 기록이 없어요: $index'));
    }
    if (index < 0 || index >= campingList.length) {
      return Center(child: CircularProgressIndicator());
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(gapMain),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              '${dio.options.baseUrl}${campingList[index].reviewImage}'),
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
              '${campingList[index].campName}',
              style: title1(mColor: kBackWhite),
            ),
            SizedBox(height: gapXSmall),
            Text(
              '${campingList[index].campAddress}',
              style: subTitle3(mColor: kBackWhite),
            ),
            SizedBox(height: gapXSmall),
            Text(
              '${campingList[index].checkInDate} - ${campingList[index].checkOutDate}',
              style: subTitle3(mColor: kBackWhite),
            ),
            SizedBox(height: gapSmall),
            Row(
              children: List.generate(
                int.parse(campingList[index].totalRating),
                (index) => iconFullStar(mColor: kBackWhite),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
