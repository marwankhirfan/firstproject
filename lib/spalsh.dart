
import 'package:firstproject/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';


import 'Screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset("assets/login_logo.png"),
      logoWidth: 150,
      title: const Text(
        "3amak AlYamani",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: CustomTheme.loginGradientStart,
      showLoader: false,
      loadingText: const Text("Welcome"),
      navigator: const loginScreen(),
      durationInSeconds: 3,
    );
  }
}