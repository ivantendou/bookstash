import 'package:bookstash/models/get_books_response.dart';
import 'package:dio/dio.dart';

class GoogleBooksService {
  final Dio _dio = Dio();

  Future<GetBooksResponse> getLatestFictionBooks() async {
    try {
      final response = await _dio.get(
        'https://www.googleapis.com/books/v1/volumes?q=subject:fiction&orderBy=newest&maxResults=10',
      );
      if (response.statusCode == 200) {
        final data = GetBooksResponse.fromJson(response.data);
        return data;
      } else {
        throw Exception('Failed to get latest books: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to get latest books: $e');
    }
  }

  Future<GetBooksResponse> getLatestHistoryBooks() async {
    try {
      final response = await _dio.get(
        'https://www.googleapis.com/books/v1/volumes?q=subject:history&orderBy=newest&maxResults=10',
      );
      if (response.statusCode == 200) {
        final data = GetBooksResponse.fromJson(response.data);
        return data;
      } else {
        throw Exception('Failed to get latest books: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to get latest books: $e');
    }
  }

  Future<GetBooksResponse> getLatestProgrammingBooks() async {
    try {
      final response = await _dio.get(
        'https://www.googleapis.com/books/v1/volumes?q=subject:programming&orderBy=newest&maxResults=10',
      );
      if (response.statusCode == 200) {
        final data = GetBooksResponse.fromJson(response.data);
        return data;
      } else {
        throw Exception('Failed to get latest books: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to get latest books: $e');
    }
  }
}
