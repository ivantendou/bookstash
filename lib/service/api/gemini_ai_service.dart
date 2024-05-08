import 'package:flutter_gemini/flutter_gemini.dart';

class GeminiAiService {
  final _gemini = Gemini.instance;

  Future<String?> getBookRecommendation(String genre, String language) async {
    try {
      final prompt =
          "**System Instructions:**\n* Output style: Descriptive and factual\n*Goal: Recommend books with $genre genre in $language language.";
      var response = await _gemini.chat([
        Content(role: 'user', parts: [Parts(text: prompt)])
      ]);
      String? data = response?.output;
      return data;
    } catch (e) {
      throw Exception('Failed to get book recommendation: $e');
    }
  }
}
