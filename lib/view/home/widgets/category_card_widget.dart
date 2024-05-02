import 'package:bookstash/constants/route_paths_constant.dart';
import 'package:bookstash/models/category_model.dart';
import 'package:bookstash/constants/colors_constant.dart';
import 'package:bookstash/constants/text_styles_constant.dart';
import 'package:flutter/material.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({
    super.key,
    required this.categories,
  });

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
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
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorConstant.sageGreen,
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(
                      category.icon,
                      size: 18,
                      color: ColorConstant.tosca,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    category.name,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyleConstant.buttonLabel.copyWith(
                        fontSize: 14,
                        color: ColorConstant.tosca,
                        fontWeight: FontWeight.w700,
                        overflow: TextOverflow.clip),
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
