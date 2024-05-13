import 'package:bookstash/models/category_model.dart';
import 'package:bookstash/models/get_books_response.dart';
import 'package:bookstash/service/api/google_books_service.dart';
import 'package:bookstash/utils/constants/image_constant.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isError = false;
  bool get isError => _isError;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

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
      _errorMessage =
          "Failed to get books data, check your internet connection";
      _isError = true;
      notifyListeners();
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
      notifyListeners();
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
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  final List<Category> _categories = [
    Category(name: "Fiction", imageAssets: ImageConstant.fictionGenre),
    Category(name: "Fantasy", imageAssets: ImageConstant.fantasyGenre),
    Category(name: "Mystery", imageAssets: ImageConstant.mysteryGenre),
    Category(name: "Romance", imageAssets: ImageConstant.romanceGenre),
    Category(name: "Horror", imageAssets: ImageConstant.horrorGenre),
    Category(name: "Comedy", imageAssets: ImageConstant.comedyGenre),
    Category(name: "Psychology", imageAssets: ImageConstant.psychologyGenre),
    Category(name: "Politics", imageAssets: ImageConstant.politicsGenre),
    Category(name: "Biography", imageAssets: ImageConstant.biographyGenre),
    Category(name: "Thriller", imageAssets: ImageConstant.thrillerGenre),
    Category(name: "Poetry", imageAssets: ImageConstant.poertyGenre),
    Category(name: "History", imageAssets: ImageConstant.historyGenre),
    Category(name: "Steampunk", imageAssets: ImageConstant.steampunkGenre),
    Category(name: "Self-Help", imageAssets: ImageConstant.selfHelpGenre),
    Category(name: "Finance", imageAssets: ImageConstant.financeGenre),
  ];
  List<Category> get categories => _categories;
}
