import 'package:bookstash/utils/constants/colors_constant.dart';
import 'package:bookstash/utils/constants/route_paths_constant.dart';
import 'package:bookstash/utils/constants/text_styles_constant.dart';
import 'package:bookstash/view_model/book_category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextHeaderWidget extends StatelessWidget {
  final String headerName;
  final String categoryName;

  const TextHeaderWidget({
    super.key,
    required this.headerName,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            headerName,
            style: TextStyleConstant.heading1.copyWith(
              fontSize: 18,
            ),
          ),
          TextButton(
            onPressed: () {
              Provider.of<BookCategoryViewModel>(context, listen: false)
                  .selectedCategory = categoryName;
              Navigator.pushNamed(
                context,
                RoutePaths.bookCategory,
              );
            },
            child: Text(
              'More',
              style:
                  TextStyleConstant.body.copyWith(color: ColorConstant.tosca),
            ),
          ),
        ],
      ),
    );
  }
}
