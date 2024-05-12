import 'package:bookstash/models/book_model.dart';
import 'package:bookstash/view_model/db_manager.dart';
import 'package:bookstash/models/get_book_detail_response.dart';
import 'package:bookstash/service/api/google_books_service.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class BookDetailViewModel extends ChangeNotifier {
  late DbManager _dbManager;

  BookDetailViewModel() {
    _dbManager = DbManager();
  }

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

  bool _isCurrentBookmarked = false;
  bool get isCurrentBookmarked => _isCurrentBookmarked;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  GetBookDetailResponse _bookDetail = GetBookDetailResponse();
  GetBookDetailResponse get bookDetail => _bookDetail;

  String? _description = '';
  String? get description => _description;

  void getBookDetail() async {
    _bookDetail = GetBookDetailResponse();
    _description = "";
    _isLoading = true;
    _isError = false;
    _errorMessage = null;
    notifyListeners();
    try {
      final data = await GoogleBooksService().getBookDetail(_selectedId);
      _bookDetail = data;
      _description = _parseHtmlString(data.volumeInfo?.description);
      final isBookmarked = await _dbManager.isBookmarked(_bookDetail.id);
      _isCurrentBookmarked = isBookmarked;
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
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch the provided link: $url');
    }
  }

  Future<void> bookmarkBook() async {
    Book book = Book(
      id: _bookDetail.id,
      title: _bookDetail.volumeInfo?.title,
      authors: _bookDetail.volumeInfo?.authors?.join(', '),
      thumbnail: _bookDetail.volumeInfo?.imageLinks?.thumbnail,
    );
    await _dbManager.addBook(book);
    _isCurrentBookmarked = true;
    notifyListeners();
  }

  void unbookmarkBook() {
    _dbManager.deleteBook(_bookDetail.id);
    _isCurrentBookmarked = false;
    notifyListeners();
  }

  void onShare(BuildContext context) async {
    var link = _bookDetail.volumeInfo?.infoLink;
    var title = _bookDetail.volumeInfo?.title;
    final box = context.findRenderObject() as RenderBox?;
    await Share.share("Check this amazing book! the title is '$title' ($link)",
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }
}
