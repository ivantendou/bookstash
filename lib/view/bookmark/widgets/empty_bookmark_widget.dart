import 'package:bookstash/constants/colors_constant.dart';
import 'package:bookstash/constants/text_styles_constant.dart';
import 'package:flutter/material.dart';

class EmptyBookmarkWidget extends StatelessWidget {
  const EmptyBookmarkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/empty-colored.png',
              height: 200,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              textAlign: TextAlign.center,
              "You haven't bookmarked any books. Click on bookmark icon in detail books to bookmark a book.",
              style: TextStyleConstant.buttonLabel.copyWith(
                color: ColorConstant.tosca,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
