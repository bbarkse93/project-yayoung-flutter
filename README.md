# YAYoung 팀 프로젝트

## 목차
- [프로젝트 소개](#프로젝트-소개)
- [시연영상](#시연-영상)
- [기술스택](#기술스택)
- [화면구성](#화면구성)
- [ERD](#erd)
- [일정관리](#일정관리)
- [보안할 점](#보안할-점)
- [느낀 점](#느낀-점)

## 프로젝트 소개

### 팀원
- 박세환 (팀장, 플러터) [<img src="https://img.shields.io/badge/Git바로가기-박세환-red?logo=GITHUb">](https://github.com/bbarkse93)
- 김대욱 (플러터) [<img src="https://img.shields.io/badge/Git바로가기-김대욱-orange?logo=GITHUb">](https://github.com/saki8661)
- 김승신 (스프링) [<img src="https://img.shields.io/badge/Git바로가기-김승신-yellow?logo=GITHUb">](https://github.com/seunggod)
- 김언약 (플러터) [<img src="https://img.shields.io/badge/Git바로가기-김언약-green?logo=GITHUb">](https://github.com/yakyakyak12)
- 남은혜 (스프링) [<img src="https://img.shields.io/badge/Git바로가기-남은혜-grey?logo=GITHUb">](https://github.com/muaga)
- 전우진 (스프링) [<img src="https://img.shields.io/badge/Git바로가기-전우진-blue?logo=GITHUb">](https://github.com/m40ro)

### 프로젝트 기간
- 2024년 1월 3일 ~ 2024년 1월 19일 (16일 간)

### 어플 설명
YaYoung은 캠핑장의 정보를 한눈에 볼 수 있고 일정을 등록해서 관리할 수 있으며 리뷰를 통해 다른 사람의 평가를 확인 할 수 있는 캠핑장 앱으로써 해당 앱을 클론 코딩 했습니다.

## 시연 영상

## 구현 기능

### 유저 관련 기능
- 소셜 로그인 (휴대폰 로컬에 jwt 저장)
- 로그아웃
- 개인정보 수정
- 회원탈퇴
- 공지사항 및 FAQ 조회

### 캠핑장 관련 기능
- 옵션별 캠핑장 목록 보기 (필터링)
- 캠핑장 리뷰 달기 (리뷰)
- 캠핑장 검색 기능 (검색)
- 캠핑장 예약(결제) / 취소(환불)
- 다가 오는 캠핑장 확인 (일정관리)
- 다녀온 캠핑장 확인
- 캠핑장 북마크
- 캠핑장 위치 연결(지도)
- 캠핑장 전화 연결
- 캠핑장 웹사이트 연결

## 기술스택

### Backend
<img src="https://img.shields.io/badge/Language-%23121011?style=for-the-badge"> <img src="https://img.shields.io/badge/java-437291?style=for-the-badge&logo=openjdk&logoColor=black"><img src="https://img.shields.io/badge/17-515151?style=for-the-badge">

<img src="https://img.shields.io/badge/Framework-%23121011?style=for-the-badge"> <img src="https://img.shields.io/badge/springboot-6DB33F?style=for-the-badge&logo=springboot&logoColor=white"><img src="https://img.shields.io/badge/3.2-515151?style=for-the-badge">

<img src="https://img.shields.io/badge/Build-%23121011?style=for-the-badge"> <img src="https://img.shields.io/badge/Gradle-02303A?style=for-the-badge&logo=Gradle&logoColor=white">


### Frontend
<img src="https://img.shields.io/badge/Language-%23121011?style=for-the-badge"> <img src="https://img.shields.io/badge/dart-02569B?style=for-the-badge&logo=dart&logoColor=white"><img src="https://img.shields.io/badge/3.2.3-515151?style=for-the-badge">
<img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black">

<img src="https://img.shields.io/badge/Framework-%23121011?style=for-the-badge"> <img src="https://img.shields.io/badge/flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white"><img src="https://img.shields.io/badge/3.13.9-515151?style=for-the-badge">
<img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white">

<img src="https://img.shields.io/badge/Build-%23121011?style=for-the-badge"> <img src="https://img.shields.io/badge/pub-02569B?style=for-the-badge&logo=dart&logoColor=white">
<img src="https://img.shields.io/badge/Gradle-02303A?style=for-the-badge&logo=Gradle&logoColor=white">

### IDE
<img src="https://img.shields.io/badge/intellijidea-ffffff?style=for-the-badge&logo=intellijidea&logoColor=black"> <img src="https://img.shields.io/badge/androidstudio-24A47F?style=for-the-badge&logo=androidstudio&logoColor=white">

### 협업도구
<img src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=Git&logoColor=white"> <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=GitHub&logoColor=white"> <img src="https://img.shields.io/badge/postman-FF6C37?style=for-the-badge&logo=postman&logoColor=white"> <img src="https://img.shields.io/badge/figma-C11920?style=for-the-badge&logo=figma&logoColor=white"> <img src="https://img.shields.io/badge/Notion-000000?style=for-the-badge&logo=Notion&logoColor=white"> <img src="https://img.shields.io/badge/slack-764ABC?style=for-the-badge&logo=slack&logoColor=white">

### 데이터베이스
<img src="https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=MySQL&logoColor=white"><img src="https://img.shields.io/badge/8.0-515151?style=for-the-badge"> <img src="https://img.shields.io/badge/h2-F9DC3E?style=for-the-badge&logo=h2&logoColor=white">
### 데이터베이스
<img src="https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=MySQL&logoColor=white"><img src="https://img.shields.io/badge/8.0-515151?style=for-the-badge"> <img src="https://img.shields.io/badge/h2-F9DC3E?style=for-the-badge&logo=h2&logoColor=white">

### 라이브러리
```dart
cupertino_icons: ^1.0.6
kakao_flutter_sdk: ^1.8.0
kakao_flutter_sdk_friend: ^1.8.0
flutter_naver_login: ^1.8.0
flutter_svg: ^2.0.9
flutter_lints: ^2.0.3
validators: ^3.0.0
font_awesome_flutter: ^10.6.0
intl: ^0.18.1
dio: ^5.4.0
flutter_riverpod: ^2.4.9  
provider: ^6.1.1
logger: ^2.0.2+1
flutter_secure_storage: ^9.0.0
animated_splash_screen: ^1.3.0
image_picker: ^1.0.7
carousel_slider: ^4.2.1
table_calendar: ^3.0.9
url_launcher: ^6.0.6
file_picker: ^6.1.1
google_maps_flutter: ^2.5.3
geocoding: ^2.1.1
iamport_flutter: ^0.10.0
webview_flutter: ^4.4.4
tuple: ^2.0.2
flutter_localization: ^0.2.0
geolocator: ^10.1.0
```

## 화면구성
[Figma 바로가기](https://www.figma.com/file/Ptkc7WCoBYO1di2kKHL7Z4/YAYoung?type=design&mode=design&t=Pxxgh3MPpkGZiqRn-0)
![img.png](img.png)
![img_1.png](img_1.png)
![img_2.png](img_2.png)
![img_3.png](img_3.png)

## ERD
[ERD 바로가기](https://dbdiagram.io/d/yayoung-6595042bac844320ae252152)
![img_4.png](img_4.png)


## 일정관리
[Notion 바로가기](https://paper-danthus-c42.notion.site/1-d1049a409e494da0a0cb1475f7978c13?pvs=4)
![img_5.png](img_5.png)

## 보완할 점

- 

## 느낀 점 

- 