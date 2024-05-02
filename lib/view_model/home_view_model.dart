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
      final data = await GoogleBooksService().getLatestFictionBooks();
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
      final data = await GoogleBooksService().getLatestHistoryBooks();
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
      final data = await GoogleBooksService().getLatestProgrammingBooks();
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
}
