import 'package:bookstash/service/api/gemini_ai_service.dart';
import 'package:flutter/material.dart';

class BookRecommendationViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _bookRecommendation = "";
  String get bookRecommendation => _bookRecommendation;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  void getBookRecommendation(String genre, String language) async {
    _isLoading = true;
    notifyListeners();

    try {
      final data =
          await GeminiAiService().getBookRecommendation(genre, language);
      _bookRecommendation = data!;
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
