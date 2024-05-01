import 'package:bookstash/constants/colors_constant.dart';
import 'package:bookstash/constants/route_paths_constant.dart';
import 'package:bookstash/constants/text_styles_constant.dart';
import 'package:flutter/material.dart';

class HomeSearchBarWidget extends StatelessWidget {
  const HomeSearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: ColorConstant.sageGreen,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            const Icon(
              Icons.search,
              size: 30,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              'Search book and author',
              style: TextStyleConstant.buttonLabel.copyWith(
                color: ColorConstant.tosca,
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(
          context,
          RoutePaths.search,
        );
      },
    );
  }
}
