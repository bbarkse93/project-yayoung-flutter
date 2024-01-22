class RefundReqDTO {
  final int orderId;
  final String orderNumber;
  final String refund;

  RefundReqDTO(
      {required this.orderId,
      required this.orderNumber,
      required this.refund});

  Map<String, dynamic> toJson() => {
        "orderId": orderId,
        "orderNumber": orderNumber,
        "refund": refund,
      };
}