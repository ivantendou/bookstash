import 'package:bookstash/models/get_book_detail_response.dart';
import 'package:bookstash/models/service/google_books_service.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailViewModel extends ChangeNotifier {
  String? _selectedId;
  String? get selectedId => _selectedId;

  set selectedId(String? id) {
    _selectedId = id;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isError = false;
  bool get isError => _isError;

  String? _errorMessage;
  String? get errorMovie => _errorMessage;

  GetBookDetailResponse _bookDetail = GetBookDetailResponse();
  GetBookDetailResponse get bookDetail => _bookDetail;

  String? _description = '';
  String? get description => _description;

  void getBookDetail() async {
    _isLoading = true;
    _isError = false;
    _errorMessage = null;
    notifyListeners();
    try {
      final data = await GoogleBooksService().getBookDetail(_selectedId);
      _bookDetail = data;
      _description = _parseHtmlString(data.volumeInfo?.description);
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isError = true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  String _parseHtmlString(String? htmlString) {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body?.text).documentElement!.text;

    return parsedString;
  }

  Future<void> launchURL(String? url) async {
  if (url != null) {
    await launchUrl(Uri.parse(url),mode: LaunchMode.externalApplication);
  } else {
    debugPrint('Could not launch the provided link: $url'); 
  }
}

  void clearBookDetail() {
    _bookDetail = GetBookDetailResponse();
    _description = "";
    notifyListeners();
  }
}
