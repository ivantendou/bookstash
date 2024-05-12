import 'package:bookstash/constants/colors_constant.dart';
import 'package:bookstash/constants/text_styles_constant.dart';
import 'package:flutter/material.dart';

class ErrorStateWidget extends StatelessWidget {
  final String imageAsset;
  final String description;
  const ErrorStateWidget({
    super.key,
    required this.imageAsset,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageAsset,
            height: 200,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            description,
            style: TextStyleConstant.buttonLabel.copyWith(
              color: ColorConstant.tosca,
            ),
          ),
        ],
      ),
    );
  }
}
