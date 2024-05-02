import 'package:bookstash/models/get_books_response.dart';
import 'package:bookstash/models/service/google_books_service.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMovie => _errorMessage;

  List<Item> _latestBooksList = [];
  List<Item> get latestBooksList => _latestBooksList;

  void getLatestBooks() async {
    _isLoading = true;
    _errorMessage = null;
    _latestBooksList.clear();
    notifyListeners();
    try {
      final data = await GoogleBooksService().getLatestBooks();
      _latestBooksList = data.items;
      notifyListeners();
    } catch (e) {
      print("Error fetching latest books: $e");
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
