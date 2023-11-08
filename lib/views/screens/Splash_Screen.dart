import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'chek_internet_page.dart';

class Splash_Screen extends StatelessWidget {
  const Splash_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: AnimatedSplashScreen(
        splash: Image.asset("assets/images/logo.png"),
        splashIconSize: 200,
        nextScreen: Check_Network_Page(),
        duration: 3000,
      ),
    );
  }
}
