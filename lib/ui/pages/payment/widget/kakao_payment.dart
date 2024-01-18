import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/* 아임포트 결제 모듈을 불러옵니다. */
import 'package:iamport_flutter/iamport_payment.dart';

/* 아임포트 결제 데이터 모델을 불러옵니다. */
import 'package:iamport_flutter/model/payment_data.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:team_project/_core/constants/icon.dart';
import 'package:team_project/_core/constants/move.dart';
import 'package:team_project/data/dto/response_dto.dart';
import 'package:team_project/data/dto/user_request_dto.dart';
import 'package:team_project/data/repository/payment_repository.dart';
import 'package:team_project/ui/pages/payment/payment_view_model.dart';

class KakaoPayment extends ConsumerWidget {
  final int campId;

  KakaoPayment({required this.campId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reservationData = ref.read(reservationDataProvider);

    return IamportPayment(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: iconArrowBack(),
          ),
          title: Text('아임포트 결제'),
          centerTitle: true),
      /* 웹뷰 로딩 컴포넌트 */
      initialChild: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/bottom_bar_tent.png'),
              Padding(padding: EdgeInsets.symmetric(vertical: 15)),
              Text('잠시만 기다려주세요...', style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
      /* [필수입력] 가맹점 식별코드 */
      userCode: 'imp51536650',
      /* [필수입력] 결제 데이터 */
      data: PaymentData(
        // PG사
        pg: 'kakaopay',
        // 결제수단
        payMethod: 'card',
        // 주문명
        name: '${reservationData.campField}',
        // 주문번호
        merchantUid: 'mid_${DateTime.now().millisecondsSinceEpoch}',
        // 결제금액
        amount: int.parse(reservationData.totalAmount.toString()),
        // 구매자 이름
        buyerName: '홍길동',
        // 구매자 연락처
        buyerTel: '01012345678',
        // 구매자 이메일
        buyerEmail: 'example@naver.com',
        // 앱 URL scheme
        appScheme: 'example',
        // 여기에 필요한 추가 데이터를 추가할 수 있습니다.
        customData: {
          'startDate': DateFormat('yyyy-MM-dd')
              .format(reservationData.startDate!)
              .substring(0, 10),
          'endDate': DateFormat('yyyy-MM-dd')
              .format(reservationData.endDate!)
              .substring(0, 10),
          'nights': reservationData.nights.toString(),
        },
      ),
      /* [필수입력] 콜백 함수 */
      callback: (Map<String, String> result) async {
        print("콜백입구 들어왔나요?");
        if (result['imp_success'] == 'true') {
          PaymentReqDTO requestDTO = PaymentReqDTO(
            campId: campId,
            checkIn: reservationData.startDate!,
            checkOut: reservationData.endDate!,
            fieldName: reservationData.campField,
            // totalPrice: reservationData.totalAmount,
          );
          print("PaymentReqDTO 통과했나요?");
          Logger().d("요청 전 campId: ${requestDTO.campId}");
          Logger().d("요청 전 checkIn: ${requestDTO.checkIn}");
          Logger().d("요청 전 checkOut: ${requestDTO.checkOut}");
          // Logger().d("요청 전 totalPrice: ${requestDTO.totalPrice}");
          Logger().d("요청 전 fieldName: ${requestDTO.fieldName}");
          ResponseDTO responseDTO =
              await PaymentRepository().fetchPayment(requestDTO);
          print("PaymentRepository 접근했나요?");

          Logger().d("campId ${requestDTO.campId}");
          Logger().d("checkIn ${requestDTO.checkIn}");
          Logger().d("checkOut ${requestDTO.checkOut}");
          // Logger().d("totalPrice ${requestDTO.totalPrice}");
          Logger().d("fieldName ${requestDTO.fieldName}");
          Logger().d("성공했니?? ${responseDTO.success}");

          if (responseDTO.success == true) {
            Navigator.pushReplacementNamed(
              context,
              Move.paymentSuccessPage,
              arguments: result,
            );
          } else {
            // 실패한 경우에 대한 처리
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("결제 실패"),
                  content: Text(responseDTO.error ?? "서버에서 에러가 발생했습니다."),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("확인"),
                    ),
                  ],
                );
              },
            );
          }
        }
      },
    );
  }
}
