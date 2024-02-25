import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash:Transform.scale(
        scale: 1.5, // Adjust scaling factor
        child: Image.asset(
          'assets/images/Logo.png',
          fit: BoxFit.cover,
        ),
      ),
      nextScreen: LoginPage(),
      splashTransition: SplashTransition.slideTransition,
      duration: 3000,
    );
  }
}
