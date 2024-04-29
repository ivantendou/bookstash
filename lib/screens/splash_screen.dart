import 'dart:async';

import 'package:bookstash/utils/constants/colors_constant.dart';
import 'package:bookstash/utils/constants/route_paths_constant.dart';
import 'package:bookstash/utils/constants/text_styles_constant.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, RoutePaths.home),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 200.0,
              height: 200.0,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              'Bookstash',
              style: TextStyleConstant.title.copyWith(
                color: ColorConstant.tealColor,
              ),
            ),
            Text(
              'The world of books in your pocket',
              style: TextStyleConstant.body.copyWith(
                color: ColorConstant.tealColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
