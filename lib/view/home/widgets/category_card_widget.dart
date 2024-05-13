import 'package:bookstash/utils/constants/route_paths_constant.dart';
import 'package:bookstash/utils/constants/colors_constant.dart';
import 'package:bookstash/utils/constants/text_styles_constant.dart';
import 'package:bookstash/view_model/book_category_view_model.dart';
import 'package:bookstash/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categories =
        Provider.of<HomeViewModel>(context, listen: false).categories;
    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              Provider.of<BookCategoryViewModel>(context, listen: false)
                  .selectedCategory = category.name;
              Navigator.pushNamed(
                context,
                RoutePaths.bookCategory,
              );
            },
            child: Container(
              width: 90,
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      clipBehavior: Clip.hardEdge,
                      child: Image.asset(
                        category.imageAssets,
                        fit: BoxFit.cover,
                        width: 60,
                        height: 60,
                        cacheHeight: 60,
                        cacheWidth: 60,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    category.name,
                    textAlign: TextAlign.center,
                    style: TextStyleConstant.buttonLabel.copyWith(
                      fontSize: 14,
                      color: ColorConstant.sageGreen,
                      fontWeight: FontWeight.w600,
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
