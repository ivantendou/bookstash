import 'package:bookstash/constants/text_styles_constant.dart';
import 'package:flutter/material.dart';

class TextHeaderWidget extends StatelessWidget {
  final String headerName;

  const TextHeaderWidget({super.key, required this.headerName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        headerName,
        style: TextStyleConstant.heading1.copyWith(
          fontSize: 18,
        ),
      ),
    );
  }
}
