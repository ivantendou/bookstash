import 'package:bookstash/service/database/database_helper.dart';

class Book {
  final String? id;
  final String? title;
  final String? authors;
  final String? thumbnail;

  Book({
    required this.id,
    required this.title,
    required this.authors,
    required this.thumbnail,
  });

  Map<String, dynamic> toMap() => {
    DatabaseHelper.columnId: id,
    DatabaseHelper.columnTitle: title,
    DatabaseHelper.columnAuthors: authors,
    DatabaseHelper.columnThumbnail: thumbnail,
  };

  factory Book.fromMap(Map<String, dynamic> map) => Book(
        id: map[DatabaseHelper.columnId] as String,
        title: map[DatabaseHelper.columnTitle] as String,
        authors: map[DatabaseHelper.columnAuthors] as String,
        thumbnail: map[DatabaseHelper.columnThumbnail] as String,
      );
}
