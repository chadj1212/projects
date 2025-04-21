import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:profile_ui_design/create.dart';
import 'package:profile_ui_design/main.dart';

class AnimatedSplashScreenWidget extends StatelessWidget {
  const AnimatedSplashScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(child: Lottie.asset("json/Animation_old.json")),
      nextScreen: RootApp(),
      splashIconSize: 350,
      backgroundColor: Colors.white,
      duration: 1000,
    );
  }
}
