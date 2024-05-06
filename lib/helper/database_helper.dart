import 'package:bookstash/models/book_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static late Database _database;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  final String _tableName = 'books';

  static const String columnId = "id";
  static const String columnTitle = "title";
  static const String columnAuthors = "authors";
  static const String columnThumbnail = "thumbnail";
  static const String columnIsFavorite = "isFavorite";

  Future<Database> _initializeDb() async {
    var db = openDatabase(
      join(await getDatabasesPath(), 'books.db'),
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE $_tableName(
            $columnId TEXT PRIMARY KEY,
            $columnTitle TEXT,
            $columnAuthors TEXT ,
            $columnThumbnail TEXT,
            $columnIsFavorite INTEGER
          )''',
        );
      },
      version: 1,
    );
    return db;
  }

  // Insert Book
  Future<void> insertBook(Book book) async {
    final Database db = await _initializeDb();
    await db.insert(
      _tableName,
      book.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Get Books
  Future<List<Book>> getBooks() async {
    final Database db = await _initializeDb();
    final List<Map<String, dynamic>> maps = await db.query(_tableName);
    return List.generate(maps.length, (i) => Book.fromMap(maps[i]));
  }

  // Delete Book
  Future<void> deleteBook(String id) async {
    final Database db = await _initializeDb();
    await db.delete(
      _tableName,
      where: "$columnId = ?",
      whereArgs: [id],
    );
  }

  Future<bool> isBookmarked(String bookId) async {
    final database = await _initializeDb();
    final maps = await database.query(
      'books',
      where: 'id = ?',
      whereArgs: [bookId],
    );
    return maps.isNotEmpty;
  }
}
