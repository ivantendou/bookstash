import 'package:bookstash/models/category_model.dart';
import 'package:bookstash/models/get_books_response.dart';
import 'package:bookstash/models/service/google_books_service.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isError = false;
  bool get isError => _isError;

  String? _errorMessage;
  String? get errorMovie => _errorMessage;

  List<Item> _fictionBooksList = [];
  List<Item> get fictionBooksList => _fictionBooksList;

  List<Item> _historyBooksList = [];
  List<Item> get historyBooksList => _historyBooksList;

  List<Item> _programmingBooksList = [];
  List<Item> get programmingBooksList => _programmingBooksList;

  // Get Latest Fiction Books
  void getLatestFictionBooks() async {
    _isLoading = true;
    _isError = false;
    _errorMessage = null;
    _fictionBooksList.clear();
    notifyListeners();
    try {
      final data = await GoogleBooksService().getLatestBooks('fiction');
      _fictionBooksList = data.items;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isError = true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Get Latest History Books
  void getLatestHistoryBooks() async {
    _isLoading = true;
    _isError = false;
    _errorMessage = null;
    _fictionBooksList.clear();
    notifyListeners();
    try {
      final data = await GoogleBooksService().getLatestBooks('history');

      _historyBooksList = data.items;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isError = true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Get Latest Programming Books
  void getLatestProgrammingBooks() async {
    _isLoading = true;
    _isError = false;
    _errorMessage = null;
    _fictionBooksList.clear();
    notifyListeners();
    try {
      final data = await GoogleBooksService().getLatestBooks('programming');
      _programmingBooksList = data.items;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isError = true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  final List<Category> _categories = [
    Category(name: "Fiction", imageAssets: 'assets/images/fiction.jpg'),
    Category(name: "Fantasy", imageAssets: 'assets/images/fantasy.jpg'),
    Category(name: "Mystery", imageAssets: 'assets/images/mystery.jpg'),
    Category(name: "Romance", imageAssets: 'assets/images/romance.jpg'),
    Category(name: "Horror", imageAssets: 'assets/images/horror.jpg'),
    Category(name: "Comedy", imageAssets: 'assets/images/comedy.jpg'),
    Category(name: "Psychology", imageAssets: 'assets/images/psychology.jpg'),
    Category(name: "Politics", imageAssets: 'assets/images/politics.jpg'),
    Category(name: "Biography", imageAssets: 'assets/images/biography.jpg'),
    Category(name: "Thriller", imageAssets: 'assets/images/thriller.jpg'),
    Category(name: "Poetry", imageAssets: 'assets/images/poetry.jpg'),
    Category(name: "History", imageAssets: 'assets/images/history.jpg'),
    Category(name: "Dsytopian", imageAssets: 'assets/images/dystopian.jpg'),
    Category(name: "Self-Help", imageAssets: 'assets/images/self-help.jpg'),
    Category(name: "Finance", imageAssets: 'assets/images/finance.jpg'),
  ];
  List<Category> get categories => _categories;
}
