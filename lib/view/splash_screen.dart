import 'dart:async';

import 'package:bookstash/utils/constants/colors_constant.dart';
import 'package:bookstash/utils/constants/image_constant.dart';
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
      const Duration(seconds: 4),
      () => Navigator.pushReplacementNamed(context, RoutePaths.root),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstant.teal,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ImageConstant.logo,
                fit: BoxFit.cover,
                width: 350.0,
                height: 350.0,
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                'Bookstash',
                style: TextStyleConstant.title.copyWith(
                  color: ColorConstant.sageGreen,
                ),
              ),
              Text(
                'The world of books in your pocket',
                style: TextStyleConstant.body.copyWith(
                  fontWeight: FontWeight.w600,
                  color: ColorConstant.sageGreen,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
