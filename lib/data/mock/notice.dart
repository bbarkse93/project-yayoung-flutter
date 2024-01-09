class notice {
  final int id;
  final String subTitle; // 제목
  final String content; // 내용
  final String createdAt;

  notice(
      {required this.id,
        required this.subTitle,
        required this.content,
        required this.createdAt});
}

List<notice> noticeList = [
  notice(
      id: 1,
      subTitle: "[공지] 구버전 E-ink 지원 종료 사전 안내_10/19(목)",
      content: "안녕하세요."
          "독서와 무제한 친해지리, 밀리의 서재입니다."
          "\n"
          "안전한 콘텐츠 및 원활한 서비스 제공을 위해 구버전 E-ink App의 지원이 종료될 예정임을 안내드립니다."
          "\n"
          "[지원종료 일자]"
          "2023년 11월 19일(일)"
          "\n"
          "[지원종료 버전]"
          "2.0.0.0 이하 버전",
      createdAt: "2023-11-10"),
  notice(
      id: 2,
      subTitle: "[공지] 개인정보처리방침 계정 안내_11/06(월)",
      content: "안녕하세요."
          "\n"
          "독서와 무제한 친해지리, 밀리의 서재입니다."
          "\n"
          "안전한 콘텐츠 및 원활한 서비스 제공을 위해 구버전 E-ink App의 지원이 종료될 예정임을 안내드립니다."
          "\n"
          "[변경 사유]"
          "2023년 11월 06일 개인정보보호법 내 개인정보 유효기간제(개정 전 39조의 6) 폐지로 관련 정책 일부 변경"
          "\n"
          "[변경 내용]"
          "밀리의 서재 서비스를 1년간 이용하지 않아도 휴면 계정으로 전환되지 않습니다.",
      createdAt: "2023-11-06"),
  notice(
      id: 3,
      subTitle: "[공지]구버전 E-ink 지원 종료 안내_11/01(일)",
      content: "content",
      createdAt: "2023-11-01"),
  notice(
      id: 4,
      subTitle: "[공지/수정완료]AOS 뷰어 내 TTS 재생 불가 안내_10/23(월)",
      content: "content",
      createdAt: "2023-10-23"),
  notice(
      id: 5,
      subTitle: "[공지]구버전 E-ink 지원 종료 사전 안내_10/09(목)",
      content: "content",
      createdAt: "2023-10-09"),
  notice(
      id: 6,
      subTitle: "[공지]카카오페이 결제수단 점검 일정 안내_09/17(일)",
      content: "content",
      createdAt: "2023-09-17"),
  notice(
      id: 7,
      subTitle: "[업데이트]2023년 08월 21일 서비스 업데이트 안내",
      content: "content",
      createdAt: "2023-08-21"),
  notice(
      id: 8,
      subTitle: "[공지]서비스 점검 사전 안내_08/10(목) 오전 02~06시",
      content: "content",
      createdAt: "2023-08-10"),
];