import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zealenergyindustries/pages/Home_page.dart';
import 'package:zealenergyindustries/pages/Login_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Widget? value;
  Future<bool> checkLogin() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.containsKey("isLogin") && prefs.getBool("isLogin")!
        ? value = HomePage()
        : value = LoginPage();
    setState(() {});
    print("splash" + value.toString());
    return prefs.getBool("isLogin")!;
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 3000,
        splash: Icons.home,
        nextScreen: value!,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.leftToRight,
        backgroundColor: Colors.deepPurple);
  }
}
