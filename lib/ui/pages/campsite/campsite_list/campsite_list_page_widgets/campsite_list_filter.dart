import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/data/dto/camp_request_dto.dart';
import 'package:team_project/ui/pages/campsite/campsite_list/campsite_list_page_widgets/campsite_bottom_sheet_filter.dart';
import 'package:team_project/ui/pages/campsite/campsite_list/campsite_list_view_model.dart';

class CampsiteListFilter extends StatefulWidget {
  const CampsiteListFilter({super.key});

  @override
  State<CampsiteListFilter> createState() => _CampsiteListFilterState();
}

class _CampsiteListFilterState extends State<CampsiteListFilter> {

  Map<String, Color> imageColors = {
    '산': kButtonGray,
    '물놀이장': kButtonGray,
    '계곡': kButtonGray,
    '카라반': kButtonGray,
    '차박': kButtonGray,
    '반려동물': kButtonGray,
  };

  List<String> selectedOptions = [];

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(color: kBackWhite),
      child: Padding(
        padding: EdgeInsets.all(gapMain),
        child: Column(
          children: [
            InkWell(
              child: Row(
                children: [
                  const Text(
                    "필터",
                    style: TextStyle(
                        fontSize: fontSemiLarge, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: gapSmall),
                  iconFilter(mColor: _getFilterIconColor())
                ],
              ),
              onTap: () {
                _showBottomSheet();
              },
            ),
            SizedBox(height: gapSmall),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                for (var entry in imageColors.entries)
                  Consumer(
                    builder: (context, ref, child) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            imageColors[entry.key] =
                            imageColors[entry.key] == kButtonGray
                                ? kButtonPrimary
                                : kButtonGray;

                            if (imageColors[entry.key] == kButtonPrimary) {
                              selectedOptions.add(entry.key);
                              CampListDTO campListDTO = CampListDTO(optionNames: selectedOptions);
                              Logger().d("DTO 값 잘 받음? ${campListDTO.optionNames}");
                              ref.read(campListProvider.notifier).campListFilter(campListDTO);
                            } else {
                              selectedOptions.remove(entry.key);
                              CampListDTO campListDTO = CampListDTO(optionNames: selectedOptions);
                              ref.watch(campListProvider.notifier).campListFilter(campListDTO);
                            }

                          });
                        },
                        child: _buildImageWidget(entry.key,
                            mColor: imageColors[entry.key]!,
                            mHeight: gapLarge,
                            mWidth: gapLarge),
                      );
                    },

                  ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildImageWidget(String name,
      {Color mColor = kButtonGray, double mHeight = 0.0, double mWidth = 0.0}) {
    switch (name) {
      case '산':
        return Column(
          children: [
            imageDetailMountains(
                mColor: mColor, mHeight: mHeight, mWidth: mWidth),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: gapXSmall),
              child: Text(
                "산",
                style: TextStyle(color: mColor),
              ),
            ),
          ],
        );
      case '물놀이장':
        return Column(
          children: [
            imageDetailWaterSlide(
                mColor: mColor, mHeight: mHeight, mWidth: mWidth),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: gapXSmall),
              child: Text(
                "물놀이장",
                style: TextStyle(color: mColor),
              ),
            ),
          ],
        );
      case '계곡':
        return Column(
          children: [
            imageDetailValley(mColor: mColor, mHeight: mHeight, mWidth: mWidth),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: gapXSmall),
              child: Text(
                "계곡",
                style: TextStyle(color: mColor),
              ),
            ),
          ],
        );
      case '카라반':
        return Column(
          children: [
            imageDetailCaravan(mColor: mColor, mHeight: mHeight, mWidth: mWidth),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: gapXSmall),
              child: Text(
                "카라반",
                style: TextStyle(color: mColor),
              ),
            ),
          ],
        );
      case '차박':
        return Column(
          children: [
            imageDetailCaravan(
                mColor: mColor, mHeight: mHeight, mWidth: mWidth),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: gapXSmall),
              child: Text(
                "차박",
                style: TextStyle(color: mColor),
              ),
            ),
          ],
        );
      case '반려동물':
        return Column(
          children: [
            imageDetailPet(mColor: mColor, mHeight: mHeight, mWidth: mWidth),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: gapXSmall),
              child: Text(
                "반려동물",
                style: TextStyle(color: mColor),
              ),
            ),
          ],
        );
      default:
        return Container();
    }
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        // 바텀시트의 내용을 정의하여 반환
        return CampsiteBottomSheetFilter();
      },
    );
  }

  Color _getFilterIconColor() {
    if (imageColors.containsValue(kButtonPrimary)) {
      return kButtonPrimary;
    } else {
      return kButtonGray;
    }
  }
}

