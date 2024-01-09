import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';

// 뒤로가기 Icon
Icon iconArrowBack({Color mColor = kPrimaryColor, double mSize = 25}) {
  return Icon(Icons.arrow_back_ios, color: mColor, size: mSize);
}

// 열기 Icon
Icon iconArrowForward({Color mColor = kPrimaryColor, double mSize = 25}) {
  return Icon(Icons.arrow_forward_ios, color: mColor, size: mSize);
}

// 빈 동그라미
Icon iconEmptyCircle({Color mColor = kPrimaryColor, double mSize = 25}) {
  return Icon(Icons.radio_button_unchecked, color: mColor, size: mSize);
}

// 체크 된 동그라미
Icon iconCheckCircle({Color mColor = kPrimaryColor, double mSize = 25}) {
  return Icon(Icons.check_circle, color: mColor, size: mSize);
}

// 빈 네모
Icon iconEmptyBox({Color mColor = kPrimaryColor, double mSize = 25}) {
  return Icon(Icons.check_box_outline_blank, color: mColor, size: mSize);
}

// 체크 된 네모
Icon iconCheckBox({Color mColor = kPrimaryColor, double mSize = 25}) {
  return Icon(Icons.check_box, color: mColor, size: mSize);
}

// 빈 별
Icon iconEmptyStar({Color mColor = kPrimaryColor, double mSize = 25}) {
  return Icon(Icons.star_border_rounded, color: mColor, size: mSize);
}

// 꽉찬 별
Icon iconFullStar({Color mColor = kPrimaryColor, double mSize = 25}) {
  return Icon(Icons.star_rounded, color: mColor, size: mSize);
}

// 빈 하트
Icon iconEmptyHeart({Color mColor = kPrimaryColor, double mSize = 25}) {
  return Icon(Icons.favorite_border_rounded, color: mColor, size: mSize);
}

// 검색
Icon iconSearch({Color mColor = Colors.black, double mSize = 25}) {
  return Icon(CupertinoIcons.search, color: mColor, size: mSize);
}

/// TODO : 바텀네비게이션 - 투데이 아이콘 결정하기
Icon iconBottomToday({Color mColor = kPrimaryColor, double mSize = 25}) {
  return Icon(Icons.accessibility, color: mColor, size: mSize);
}

// 꽉찬 하트
Icon iconFullHeart({Color mColor = kPrimaryColor, double mSize = 25}) {
  return Icon(Icons.favorite_rounded, color: mColor, size: mSize);
}

// 도시
Icon iconCity({Color mColor = kPrimaryColor, double mSize = 25}) {
  return Icon(Icons.apartment, color: mColor, size: mSize);
}

Icon iconRefund({Color mColor = kPrimaryColor, double mSize = 25}) {
  return Icon(CupertinoIcons.gobackward, color: mColor, size: mSize);
}

Icon iconHamburgerMenu({Color mColor = kPrimaryColor, double mSize = 25}) {
  return Icon(Icons.density_medium_rounded, color: mColor, size: mSize);
}

// 창 닫기 Icon
Icon iconClose({Color mColor = kPrimaryColor, double mSize = 25}) {
  return Icon(Icons.close, color: mColor, size: mSize);
}


// 채팅 지우기 Icon
Icon iconChattingClose({Color mColor = kPrimaryColor, double mSize = 25}) {
  return Icon(Icons.cancel, color: mColor, size: mSize);
}

// 설정
Image imageMyPageSetting({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/my_page_setting.png", width: mWidth,
      height: mHeight,
      color: mColor);
}

Icon iconFilter({Color mColor = kPrimaryColor, double mSize = 25}) {
  return Icon(CupertinoIcons.slider_horizontal_3, color: mColor, size: mSize);
}

// 바텀 바 홈 Icon
Image imageBottomBarHome({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/bottom_bar_home.png", width: mWidth, height: mHeight, color: mColor);
}

// 바텀바 홈선택 Icon
Image imageBottomBarHomeActive({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/bottom_bar_home_active.png", width: mWidth, height: mHeight, color: mColor);
}

// 바텀 바 캠핑 Icon
Image imageBottomBarCamping({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/bottom_bar_tent.png", width: mWidth, height: mHeight, color: mColor);
}

// 바텀 바 캠핑선택 Icon
Image imageBottomBarCampingActive({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/bottom_bar_tent_active.png", width: mWidth, height: mHeight, color: mColor);
}

// 바텀 바 유저 Icon
Image imageBottomBarUser({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/bottom_bar_user.png", width: mWidth, height: mHeight, color: mColor);
}

// 바텀 바 유저선택 Icon
Image imageBottomBarUserActive({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/bottom_bar_user_active.png", width: mWidth, height: mHeight, color: mColor);
}

// 디테일 바베큐 Icon
Image imageDetailBBQ({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/detail_bbq.png", width: mWidth, height: mHeight, color: mColor);
}

// 디테일 해수욕 Icon
Image imageDetailBeach({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/detail_beach_chair.png", width: mWidth, height: mHeight, color: mColor);
}

// 디테일 장작 Icon
Image imageDetailBonfire({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/detail_bonfire.png", width: mWidth, height: mHeight, color: mColor);
}

// 디테일 차박 Icon
Image imageDetailCarCamping({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/detail_car_camping.png", width: mWidth, height: mHeight, color: mColor);
}

// 디테일 커라반 Icon
Image imageDetailCaravan({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/detail_caravan.png", width: mWidth, height: mHeight, color: mColor);
}

// 디테일 숯 Icon
Image imageDetailCharcoal({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/detail_charcoal.png", width: mWidth, height: mHeight, color: mColor);
}

// 디테일 파쇄석 Icon
Image imageDetailCrushedStone({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/detail_crushed_stone.png", width: mWidth, height: mHeight, color: mColor);
}

// 디테일 데크 Icon
Image imageDetailDeck({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/detail_deck.png", width: mWidth, height: mHeight, color: mColor);
}

// 디테일 등유 Icon
Image imageDetailEngineOil({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/detail_engine_oil.png", width: mWidth, height: mHeight, color: mColor);
}

// 디테일 낚시 Icon
Image imageDetailFishing({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/detail_fishing.png", width: mWidth, height: mHeight, color: mColor);
}

// 디테일 잔디 Icon
Image imageDetailGrass({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/detail_grass.png", width: mWidth, height: mHeight, color: mColor);
}

// 디테일 등산/트래킹 Icon
Image imageDetailHiking({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/detail_hiking.png", width: mWidth, height: mHeight, color: mColor);
}

// 디테일 온수 Icon
Image imageDetailHotwater({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/detail_hotwater.png", width: mWidth, height: mHeight, color: mColor);
}

// 디테일 얼음 Icon
Image imageDetailIce({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/detail_ice.png", width: mWidth, height: mHeight, color: mColor);
}

// 디테일 키즈 Icon
Image imageDetailKids({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/detail_kids.png", width: mWidth, height: mHeight, color: mColor);
}

// 디테일 모터홈 Icon
Image imageDetailMotorHome({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/detail_motor_home.png", width: mWidth, height: mHeight, color: mColor);
}

// 디테일 산 Icon
Image imageDetailMountains({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/detail_mountains.png", width: mWidth, height: mHeight, color: mColor);
}

// 디테일 갯벌 Icon
Image imageDetailMud({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/detail_mud.png", width: mWidth, height: mHeight, color: mColor);
}

// 디테일 오토캠핑 Icon
Image imageDetailOtter({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/detail_otter_amping.png", width: mWidth, height: mHeight, color: mColor);
}

// 디테일 난방 Icon
Image imageDetailPelletStove({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/detail_pellet_stove.png", width: mWidth, height: mHeight, color: mColor);
}

// 디테일 반려동물 Icon
Image imageDetailPet({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/detail_pet.png", width: mWidth, height: mHeight, color: mColor);
}

// 디테일 릴선 Icon
Image imageDetailReelWire({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/detail_reel_wire.png", width: mWidth, height: mHeight, color: mColor);
}

// 디테일 매점 Icon
Image imageDetailSchoolStore({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/detail_school_store.png", width: mWidth, height: mHeight, color: mColor);
}

// 디테일 샤워장 Icon
Image imageDetailShower({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/detail_shower.png", width: mWidth, height: mHeight, color: mColor);
}

// 디테일 전기 Icon
Image imageDetailSocket({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/detail_socket.png", width: mWidth, height: mHeight, color: mColor);
}

// 디테일 술 Icon
Image imageDetailSoju({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/detail_soju.png", width: mWidth, height: mHeight, color: mColor);
}

// 디테일 트레일러 Icon
Image imageDetailTrailer({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/detail_trailer.png", width: mWidth, height: mHeight, color: mColor);
}

// 디테일 계곡 Icon
Image imageDetailValley({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/detail_valley.png", width: mWidth, height: mHeight, color: mColor);
}

// 디테일 계곡 물놀이 Icon
Image imageDetailWaterPolo({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/detail_water_polo.png", width: mWidth, height: mHeight, color: mColor);
}

// 디테일 물놀이장 Icon
Image imageDetailWaterSlide({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/detail_water_slide.png", width: mWidth, height: mHeight, color: mColor);
}

// 디테일 와이파이 Icon
Image imageDetailWifi({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/detail_wifi.png", width: mWidth, height: mHeight, color: mColor);
}

// 디테일 지도 캠핑장 Icon
Image imageMapTent({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/map_tent.png", width: mWidth, height: mHeight, color: mColor);
}

// MyPage 일정 Icon
Image imageMyPageCalender({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/my_page_calendar.png", width: mWidth, height: mHeight, color: mColor);
}

// MyPage 다녀온 캠핑장 Icon
Image imageMyPageFlag({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/my_page_flag.png", width: mWidth, height: mHeight, color: mColor);
}

// MyPage 공지사항 Icon
Image imageMyPageNotice({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/my_page_notice.png", width: mWidth, height: mHeight, color: mColor);
}

// MyPage 결제 Icon
Image imageMyPageRefund({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/my_page_refund.png", width: mWidth, height: mHeight, color: mColor);
}

// MyPage 회원/로그인 Icon
Image imageMyPageUser({Color mColor = kPrimaryColor, double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/my_page_user.png", width: mWidth, height: mHeight, color: mColor);
}

// 자동 로그인 ON
Image imageSettingOnButton({double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/setting_on_button.png", width: mWidth, height: mHeight);
}

// 자동 로그인 OFF
Image imageSettingOffButton({double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/setting_off_button.png", width: mWidth, height: mHeight);
}

// like 빈 이미지
Image imageLikePage({double mWidth = 25, double mHeight = 25}) {
  return Image.asset("assets/images/like_page.png", width: mWidth, height: mHeight);
}

Icon iconBottomSetting({Color mColor = kBackBlack, double mSize = 25}) {
  return Icon(CupertinoIcons.profile_circled, color: mColor, size: mSize);
}