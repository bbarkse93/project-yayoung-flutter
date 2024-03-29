import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:team_project/ui/pages/auth/login_page.dart';

class SplashPageBody extends StatelessWidget {
  const SplashPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedSplashScreen(
        splash: SizedBox(
          height: 200,
          child: Image.asset(
            "assets/images/yayoung_logo.png",
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
        ),
        nextScreen: LoginPage(),
        duration: 3000,
      ),
    );
  }
}
