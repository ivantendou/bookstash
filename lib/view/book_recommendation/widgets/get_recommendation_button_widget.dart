import 'package:bookstash/utils/constants/colors_constant.dart';
import 'package:bookstash/utils/constants/text_styles_constant.dart';
import 'package:flutter/material.dart';

class GetRecommendationButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  const GetRecommendationButtonWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          ColorConstant.teal,
        ),
        foregroundColor: MaterialStateProperty.all<Color>(
          ColorConstant.sageGreen,
        ),
      ),
      child: Text(
        'Get Recommendation',
        style: TextStyleConstant.buttonLabel,
      ),
    );
  }
}
