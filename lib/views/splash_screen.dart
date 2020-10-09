import 'package:animated_splash/animated_splash.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/views/home_page.dart';

class SplashScreenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplash(
      home: HomePage(),
      imagePath: 'assets/images/splash.png',
      duration: 2500,
      type: AnimatedSplashType.StaticDuration,
    );
  }
}
