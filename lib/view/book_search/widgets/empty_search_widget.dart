import 'package:bookstash/utils/constants/colors_constant.dart';
import 'package:bookstash/utils/constants/text_styles_constant.dart';
import 'package:flutter/material.dart';

class EmptySearchWidget extends StatelessWidget {
  final String imageAsset;
  final String description;
  const EmptySearchWidget({
    super.key,
    required this.imageAsset,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
