import 'package:bookstash/utils/constants/text_styles_constant.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Text(
          "Home Screen - on Progress",
          style: TextStyleConstant.body,
        ),
      ),
    );
  }
}
