import 'package:bookstash/models/get_books_response.dart';
import 'package:bookstash/models/service/google_books_service.dart';
import 'package:flutter/material.dart';

class BookCategoryViewModel extends ChangeNotifier {
  String _selectedCategory = "";
  String get selectedCategory => _selectedCategory;

  set selectedCategory(String? categoryName) {
    _selectedCategory = categoryName!;
    notifyListeners();
  }

  String? _errorMessage;
  String? get errorMovie => _errorMessage;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isLoadingMore = false;
  bool get isLoadingMore => _isLoadingMore;

  List<Item> _books = [];
  List<Item> get books => _books;

  int _startIndex = 0;
  int get startIndex => _startIndex;

  void handleScrollEvent(double pixels, double maxScrollExtent) {
    if (pixels == maxScrollExtent && !_isLoadingMore) {
      _startIndex += 11;
      getBooks();
    }
  }

  void getBooks() async {
    _isLoading = true;
    _isLoadingMore = true;
    notifyListeners();
    try {
      final data = await GoogleBooksService()
          .getBooksByCategory(selectedCategory, startIndex.toString());
      _books = _books + data.items;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      print(e);
    } finally {
      _isLoading = true;
      _isLoadingMore = false;
      notifyListeners();
    }
  }

  void clearBookDetail() {
    _books = [];
    notifyListeners();
  }
}
