import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:vitrapp/view/login/login.dart';
import 'package:vitrapp/view/splash_view/splash.dart';
// ignore: depend_on_referenced_packages
import 'package:page_transition/page_transition.dart';

class SplasInit extends StatelessWidget {
  const SplasInit({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: const Splash(),
      nextScreen: const Login(),
      duration: 6000,
      splashIconSize: 400,
      pageTransitionType: PageTransitionType.topToBottom,
    );
  }
}
