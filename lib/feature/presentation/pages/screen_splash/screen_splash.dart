import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do_list/core/theme/colors.dart';
import 'package:to_do_list/feature/presentation/pages/screen_home/screen_home.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    splashingTiming();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgBottom,
      body: Center(
        child: Lottie.asset("assets/splash-animation.json",height: 250),
      ),
    );
  }
  Future<void>splashingTiming()async{
    await Future.delayed(Duration(milliseconds: 2500));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ScreenHome()));
  }
}