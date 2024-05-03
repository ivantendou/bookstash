import 'package:bookstash/constants/colors_constant.dart';
import 'package:bookstash/constants/text_styles_constant.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          child: SizedBox(
            height: 50,
            child: TextFormField(
              style: TextStyleConstant.buttonLabel.copyWith(
                color: ColorConstant.teal,
                fontSize: 18,
              ),
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                fillColor: ColorConstant.sageGreen,
                filled: true,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                label: Text(
                  'Search book & author',
                  style: TextStyleConstant.buttonLabel.copyWith(
                    color: ColorConstant.tosca,
                    fontSize: 18,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 20,
                ),
                hintText: 'Search book & author',
                hintStyle: TextStyleConstant.buttonLabel.copyWith(
                  color: ColorConstant.tosca,
                  fontSize: 18,
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  // onPressed: _controller.clear,
                  icon: Icon(
                    Icons.clear,
                    color: ColorConstant.teal,
                    size: 30,
                  ),
                ),
              ),
              textInputAction: TextInputAction.search,
              onFieldSubmitted: (query) {
                // ketika tombol search diklik lakukan sesuatu di sini
              },
            ),
          ),
        ),
      ],
    );
  }
}
