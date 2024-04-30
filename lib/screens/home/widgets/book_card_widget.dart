import 'package:bookstash/constants/colors_constant.dart';
import 'package:bookstash/constants/text_styles_constant.dart';
import 'package:flutter/material.dart';

class BookCardWidget extends StatelessWidget {
  const BookCardWidget({
    super.key,
    required this.item,
  });

  final Map<String, String> item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              color: ColorConstant.teal,
            ),
            height: 200,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            item['title']!,
            style: TextStyleConstant.body.copyWith(
              fontWeight: FontWeight.w700,
              overflow: TextOverflow.ellipsis,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            item['author']!,
            style: TextStyleConstant.body.copyWith(
              fontWeight: FontWeight.w400,
              overflow: TextOverflow.ellipsis,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
