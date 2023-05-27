import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taw_mvvm/ui/screens/main_screen.dart';
import '/data/constants/animations.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1),
        () => Navigator.pushReplacementNamed(context, MainScreen.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(waitingLottie),
      ),
    );
  }
}
