import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/move.dart';
import 'package:team_project/_core/constants/size.dart';
import 'package:team_project/ui/pages/refund/widget/campsite_info_form.dart';

class ReservationPage extends StatefulWidget {
  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  DateTime? _startDate;
  DateTime? _endDate;

  Future<void> _selectDateRange(BuildContext context) async {
    DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2024, 1, 1),
      lastDate: DateTime(2030, 12, 31),
    );

    if (picked != null && picked.start != null && picked.end != null) {
      setState(() {
        _startDate = picked.start;
        _endDate = picked.end;
      });
    }
  }

  String _formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: iconArrowBack()),
        title: Text(
          '캠핑날짜',
          style: subTitle1(),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, Move.paymentPage);
            },
            child: Text(
              "다음",
              style: subTitle1(),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          CampsiteInfoForm(
              campsiteImage: "assets/images/tent1.png",
              campsite: "물가솔솔캠핑장",
              campsiteAddress: "강원도 홍천 내면 광원리 471-4",
              campsitePriceMin: 45000,
              campsitePriceMax: 55000,
              run: "운영중"),
          SizedBox(height: gapMain),
          Padding(
            padding: const EdgeInsets.all(gapMain),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/campsite_area1.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: gapMain),
                Container(
                  width: double.infinity,
                  color: kSubColor,
                  child: Padding(
                    padding: const EdgeInsets.all(gapMain),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "선택한 날짜",
                              style: subTitle1(),
                            ),
                            ElevatedButton(
                              onPressed: () => _selectDateRange(context),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kPrimaryColor,
                              ),
                              child: Text(
                                '기간 선택하기',
                                style: subTitle2(mColor: kBackWhite),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: gapLarge),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              _startDate != null && _endDate != null
                                  ? '${_formatDate(_startDate!)} - ${_formatDate(_endDate!)}'
                                  : '기간을 선택해주세요',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: gapXLarge),
                ReservationOptionForm(isChecked: isChecked),
                ReservationOptionForm(isChecked: isChecked),
                ReservationOptionForm(isChecked: isChecked),
                ReservationOptionForm(isChecked: isChecked),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReservationOptionForm extends StatelessWidget {
  final bool isChecked;

  ReservationOptionForm({required this.isChecked});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              "A-1",
              style: subTitle2(),
            ),
            SizedBox(width: gapXLarge),
            Text(
              "100,000원/2박",
              style: subTitle2(),
            ),
          ],
        ),
        Checkbox(
          value: isChecked,
          onChanged: (bool? value) {
            // Handle checkbox state change
          },
          activeColor: kPrimaryColor,
          checkColor: kBackWhite,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ],
    );
  }
}
