import 'package:bookstash/constants/text_styles_constant.dart';
import 'package:flutter/material.dart';

class TextHeaderWidget extends StatelessWidget {
  const TextHeaderWidget({super.key, required this.headerName});

  final String headerName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        headerName,
        style: TextStyleConstant.heading1,
      ),
    );
  }
}
