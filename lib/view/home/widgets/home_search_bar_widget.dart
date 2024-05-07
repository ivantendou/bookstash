import 'package:bookstash/constants/colors_constant.dart';
import 'package:bookstash/constants/route_paths_constant.dart';
import 'package:bookstash/constants/text_styles_constant.dart';
import 'package:flutter/material.dart';

class HomeSearchBarWidget extends StatelessWidget {
  const HomeSearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: ColorConstant.sageGreen,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Image.asset(
                'assets/images/search.png',
                height: 24,
                color: ColorConstant.tosca,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                'Search book & author',
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
      ),
    );
  }
}
