import 'package:bookstash/constants/colors_constant.dart';
import 'package:bookstash/constants/text_styles_constant.dart';
import 'package:flutter/material.dart';

class InitialRecommendationWidget extends StatelessWidget {
  const InitialRecommendationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 30,
        ),
        Image.asset(
          'assets/images/robot-colored.png',
          height: 200,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          textAlign: TextAlign.center,
          "Hello, I'am Bookstash AI. You can get my recommendation by inserting book's genre and book's language.",
          style: TextStyleConstant.buttonLabel.copyWith(
            color: ColorConstant.tosca,
          ),
        ),
      ],
    );
  }
}
