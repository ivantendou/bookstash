import 'package:flutter/material.dart';

class BookCategoryViewModel extends ChangeNotifier {
  String? _selectedCategory;
  String? get selectedCategory => _selectedCategory;

  set selectedCategory(String? categoryName) {
    _selectedCategory = categoryName;
    notifyListeners();
  }
}