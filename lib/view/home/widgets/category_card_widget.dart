import 'package:bookstash/constants/route_paths_constant.dart';
import 'package:bookstash/models/category_model.dart';
import 'package:bookstash/constants/colors_constant.dart';
import 'package:bookstash/constants/text_styles_constant.dart';
import 'package:flutter/material.dart';

class CategoryCardWidget extends StatelessWidget {
  final List<Category> categories;

  const CategoryCardWidget({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                RoutePaths.categoryBooks,
                arguments: category.name,
              );
            },
            child: Container(
              width: 80,
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Column(
                children: [
                  ClipOval(
                    clipBehavior: Clip.hardEdge,
                    child: Image.asset(
                      'assets/images/fantasy.jpg',
                      fit: BoxFit.cover,
                      width: 60,
                      height: 60,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    category.name,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyleConstant.buttonLabel.copyWith(
                      fontSize: 14,
                      color: ColorConstant.teal,
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
