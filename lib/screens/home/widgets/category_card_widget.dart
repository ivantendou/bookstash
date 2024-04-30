import 'package:bookstash/constants/route_paths_constant.dart';
import 'package:bookstash/model/category_model.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        children: categories
            .map(
              (category) => GestureDetector(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  margin: const EdgeInsets.only(
                    left: 5.0,
                    right: 5.0,
                    top: 10.0,
                    bottom: 10.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: ColorConstant.sageGreen,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        category.icon,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        category.name,
                        style: TextStyleConstant.buttonLabel.copyWith(
                          fontSize: 16,
                          color: ColorConstant.tosca,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutePaths.categoryBooks,
                    arguments: category.name,
                  );
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
