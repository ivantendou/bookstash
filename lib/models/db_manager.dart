import 'package:bookstash/helper/database_helper.dart';
import 'package:bookstash/models/book_model.dart';
import 'package:flutter/material.dart';

class DbManager extends ChangeNotifier {
  List<Book> _books = [];
  late DatabaseHelper _dbHelper;

  List<Book> get books => _books;

  DbManager() {
    _dbHelper = DatabaseHelper();
    getAllBooks();
  }

  void getAllBooks() async {
    _books = await _dbHelper.getBooks();
    notifyListeners();
  }

  Future<void> addBook(Book book) async {
    await _dbHelper.insertBook(book);
    getAllBooks();
  }

  void deleteBook(String? id) async {
    await _dbHelper.deleteBook(id!);
    getAllBooks();
  }

  Future<bool> isBookmarked(String? id) async {
    final state = await _dbHelper.isBookmarked(id!);
    return state;
  }
}
