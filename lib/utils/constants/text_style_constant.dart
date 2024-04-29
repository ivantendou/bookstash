import 'package:flutter/material.dart';

class TextStyleConstant {
  static const TextStyle _baseOpenSans = TextStyle(
    fontFamily: 'Open Sans',
  );

  static final TextStyle heading1 = _baseOpenSans.copyWith(
    fontSize: 32,
    fontWeight: FontWeight.w800,
  );

  static final TextStyle heading2 = _baseOpenSans.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle heading3 = _baseOpenSans.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle body = _baseOpenSans.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle buttonLabel = _baseOpenSans.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
}
