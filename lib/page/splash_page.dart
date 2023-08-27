import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:submission_pemula/home_screen.dart';
import 'package:submission_pemula/onboarding_screen.dart';

setData(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;
  await Future.delayed(const Duration(seconds: 2)).then((value) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return showHome == true
              ? const HomeScreen()
              : const OnBoardingScreen();
        },
      ),
    );
  });
}

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setData(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/Logo.png',
              width: 350,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Manganan House',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 40,
                fontWeight: FontWeight.w900,
              ),
            )
          ],
        ),
      ),
    );
  }
}
