import 'package:bookstash/constants/route_paths_constant.dart';
import 'package:bookstash/constants/text_styles_constant.dart';
import 'package:flutter/material.dart';

class BookCardWidget extends StatelessWidget {
  final String? title;
  final String? author;
  final String? imageUrl;

  const BookCardWidget({
    super.key,
    required this.title,
    required this.author,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      width: 160,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            RoutePaths.detail,
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  imageUrl!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              title!,
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
              author!,
              style: TextStyleConstant.body.copyWith(
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
