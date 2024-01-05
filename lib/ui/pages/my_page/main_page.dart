


import 'package:flutter/material.dart';
import 'package:team_project/_core/constants/color.dart';
import 'package:team_project/ui/pages/auth/login_page.dart';
import 'package:team_project/ui/pages/home/home_page.dart';
import 'package:team_project/ui/pages/my_page/test.dart';
import 'package:team_project/ui/widgets/navigation_Item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  void _onTabbed(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: IndexedStack(
            index: _currentIndex,
            children: [
              LoginPage(),
              HomePage(),
              Test(),
            ],
          ),
        ),
      bottomNavigationBar: BottomNavigationBar(
        items: List.generate(
          navigationItem.length,
              (index) => _buildBottomNavigationBarItem(
              icon: navigationItem[index].icon,
              imgUrl: navigationItem[index].imgUrl),
        ),
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kPrimaryColor,
        backgroundColor: Colors.white,
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        onTap: _onTabbed,
        showSelectedLabels: false, // 선택된 항목 라벨 숨김
        showUnselectedLabels: false, // 선택되지 않은 항목 라벨 숨김
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      {dynamic? icon, dynamic? imgUrl}) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        child: SizedBox(
          child: icon,
        ),
      ),
      activeIcon: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        child: SizedBox(
          child: imgUrl,
        ),
      ),
      label: "",
    );
  }
}