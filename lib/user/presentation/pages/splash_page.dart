import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:plant_disease/user/presentation/pages/login_page.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset(
        'assets/images/splash.json',
        width: 250,
        height: 250,
        fit: BoxFit.cover, // or BoxFit.fill, BoxFit.contain, etc.
      ),
      nextScreen: LoginPage(),
      splashTransition: SplashTransition.slideTransition,
      duration: 3000,
    );
  }
}

