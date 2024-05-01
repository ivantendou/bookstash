import 'package:bookstash/constants/colors_constant.dart';
import 'package:bookstash/constants/text_styles_constant.dart';
import 'package:flutter/material.dart';

class BookInformationCardWidget extends StatelessWidget {
  const BookInformationCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ColorConstant.sageGreen,
      ),
      child: IntrinsicHeight(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Container(
                padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
                child: Column(
                  children: [
                    Text(
                      'The Art of War gggggggggggggggggggggggggggggggkkkkkkk',
                      textAlign: TextAlign.center,
                      style: TextStyleConstant.heading2.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'by Sun Tzu Ziggyzaggazadeiruweiruesurkkkkkkkkkkkkkkkkkkk',
                      textAlign: TextAlign.center,
                      style: TextStyleConstant.body,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      'Page',
                      style: TextStyleConstant.body,
                    ),
                    Text(
                      '354',
                      style: TextStyleConstant.heading3.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Language',
                      style: TextStyleConstant.body,
                    ),
                    Text(
                      'EN',
                      style: TextStyleConstant.heading3.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Published',
                      style: TextStyleConstant.body,
                    ),
                    Text(
                      '1980',
                      style: TextStyleConstant.heading3.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              width: double.infinity,
              height: 75,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: ColorConstant.teal,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.library_books,
                          color: ColorConstant.sageGreen,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Read',
                          style: TextStyleConstant.buttonLabel.copyWith(
                            color: ColorConstant.sageGreen,
                          ),
                        ),
                      ],
                    ),
                  ),
                  VerticalDivider(
                    thickness: 1,
                    color: ColorConstant.sageGreen,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          color: ColorConstant.sageGreen,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Buy',
                          style: TextStyleConstant.buttonLabel.copyWith(
                            color: ColorConstant.sageGreen,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
