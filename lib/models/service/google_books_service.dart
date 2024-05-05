import 'package:bookstash/models/get_book_detail_response.dart';
import 'package:bookstash/models/get_books_response.dart';
import 'package:dio/dio.dart';

class GoogleBooksService {
  final Dio _dio = Dio();

  Future<GetBooksResponse> getLatestBooks(String subject) async {
    try {
      final response = await _dio.get(
        'https://www.googleapis.com/books/v1/volumes?q=subject:$subject&orderBy=newest&maxResults=10',
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

  Future<GetBookDetailResponse> getBookDetail(String? id) async {
    try {
      final response = await _dio.get(
        'https://www.googleapis.com/books/v1/volumes/$id',
      );
      if (response.statusCode == 200) {
        final data = GetBookDetailResponse.fromJson(response.data);
        return data;
      } else {
        throw Exception('Failed to get books detail: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to get books detail: $e');
    }
  }

  Future<GetBooksResponse> getBooksByCategory(
      String subject, String startIndex) async {
    try {
      final response = await _dio.get(
        'https://www.googleapis.com/books/v1/volumes?q=subject:$subject&startIndex=$startIndex&maxResults=10',
        // 'https://www.googleapis.com/books/v1/volumes?q=subject:dystopian&startIndex=0&maxResults=10',
      );
      if (response.statusCode == 200) {
        final data = GetBooksResponse.fromJson(response.data);
        return data;
      } else {
        throw Exception('Failed to get books: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to get books: $e');
    }
  }

  Future<GetBooksResponse> getBooksByQueryText(
      String query, String startIndex) async {
    try {
      final response = await _dio.get(
          'https://www.googleapis.com/books/v1/volumes?q=$query&startIndex=$startIndex&maxResults=10');
      if (response.statusCode == 200) {
        final data = GetBooksResponse.fromJson(response.data);
        return data;
      } else {
        throw Exception('Failed to get books: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to get books: $e');
    }
  }
}
