import 'package:bookstash/constants/colors_constant.dart';
import 'package:bookstash/constants/text_styles_constant.dart';
import 'package:flutter/material.dart';

class BookRecommendationForm extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final String hintText;
  const BookRecommendationForm({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyleConstant.buttonLabel.copyWith(
        color: ColorConstant.teal,
        fontSize: 18,
      ),
      
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field must not be empty';
        }
        return null;
      },
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
          label,
          style: TextStyleConstant.buttonLabel.copyWith(
            color: ColorConstant.tosca,
            fontSize: 18,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
        hintText: hintText,
        hintStyle: TextStyleConstant.buttonLabel.copyWith(
          color: ColorConstant.tosca,
          fontSize: 18,
        ),
      ),
    );
  }
}
