// import 'package:flutter/material.dart';
// import 'package:team_project/_core/constants/color.dart';
// import 'package:team_project/_core/constants/size.dart';
//
// class ReservationOptionForm extends StatefulWidget {
//   final bool isChecked;
//   final String area;
//   final int reservationPrice;
//   final int countDay;
//   final ValueChanged<bool?> onChanged;
//
//   ReservationOptionForm({
//     required this.isChecked,
//     required this.area,
//     required this.reservationPrice,
//     required this.countDay,
//     required this.onChanged,
//   });
//
//   @override
//   _ReservationOptionFormState createState() => _ReservationOptionFormState();
// }
//
// class _ReservationOptionFormState extends State<ReservationOptionForm> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           children: [
//             Text(
//               "${widget.area}",
//               style: subTitle2(),
//             ),
//             SizedBox(width: gapXLarge),
//             Text(
//               "${widget.reservationPrice}원/${widget.countDay}박",
//               style: subTitle2(),
//             ),
//           ],
//         ),
//         Checkbox(
//           value: widget.isChecked,
//           onChanged: widget.onChanged,
//           activeColor: kPrimaryColor,
//           checkColor: kBackWhite,
//           materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//         ),
//       ],
//     );
//   }
// }