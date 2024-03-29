class ResponseDTO {
  final bool success ; // 서버에서 요청 성공 여부를 응답할 때 사용되는 변수
  dynamic error; // 서버에서 응답 시 보내는 메시지를 담아두는 변수
  String? token; // 헤더로 던진 토큰 값을 담아두는 변수
  dynamic response;

  ResponseDTO(this.success, this.error, this.response); // 서버에서 응답한 데이터를 담아두는 변수

  ResponseDTO.fromJson(Map<String, dynamic> json)
      : success = json["success"],
        response = json["response"],
        token = json["token"],
        error = json["error"];

  @override
  String toString() {
    return '통신 후 레파지토리: {success: $success, error: $error, token: $token, response: $response}';
  }
}
