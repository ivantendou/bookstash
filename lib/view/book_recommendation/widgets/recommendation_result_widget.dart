import 'package:bookstash/constants/colors_constant.dart';
import 'package:bookstash/constants/text_styles_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class RecommendationResultWidget extends StatelessWidget {
  final String answer;
  const RecommendationResultWidget({
    super.key,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorConstant.teal),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/robot-colored.png',
                  height: 50,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  'Here is my recommendation...',
                  style: TextStyleConstant.body
                      .copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
            Markdown(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              data: answer,
              styleSheet: MarkdownStyleSheet(
                p: TextStyleConstant.body.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
