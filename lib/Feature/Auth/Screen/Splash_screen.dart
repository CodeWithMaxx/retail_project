import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:retail_project/Feature/Auth/Screen/BottamNavigation_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Core/Theme/color_pallets.dart';
import '../../Home/Navbar.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool? loggedIN;
  @override
  void initState() {
    super.initState();
    wheretoGo();
  }

  void wheretoGo() {
    Timer(Duration(seconds: 2), () async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      final logIN = preferences.getBool("loggedIN");
      print(loggedIN);
      if (logIN == true) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => BottamNavigationbar()));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
      }
    });
  }

  // void navigateUser() async {}

  // wheretoGo() async {
  //   var checkuser = await SharedPreferences.getInstance();
  //   bool? value = checkuser.getBool("login");
  //   if (value != null) if (value != null) {
  //     if (value) {
  //       return Navigator.pushReplacement(
  //           context, MaterialPageRoute(builder: (context) => HomePage()));
  //     } else {
  //       return Navigator.pushReplacement(
  //           context, MaterialPageRoute(builder: (context) => LoginPage()));
  //     }
  //   } else {
  //     return Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => LoginPage()));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        ColorPallets.secondaryColor,
        ColorPallets.secondaryColor
      ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
      child: Center(
        child: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              "𝖠𝖺𝖽𝗁𝖺𝗋 𝖨𝗇𝖽𝗎𝗌𝗍𝗋𝗂𝖾𝗌",
              textStyle: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: ColorPallets.primaryColor),
              speed: const Duration(milliseconds: 300),
            ),
          ],
          // totalRepeatCount: 2,
          // pause: const Duration(milliseconds: 1000),
          displayFullTextOnTap: true,
          stopPauseOnTap: true,
        ),
      ),
    )));
  }
}
