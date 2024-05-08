import 'package:bookstash/constants/colors_constant.dart';
import 'package:bookstash/constants/text_styles_constant.dart';
import 'package:bookstash/view_model/db_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bookstash/view/bookmark/widgets/index.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DbManager>().getAllBooks();
    });
  }

  @override
  Widget build(BuildContext context) {
    var books = Provider.of<DbManager>(context, listen: true).books;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bookmark List',
          style: TextStyleConstant.heading1.copyWith(
            color: ColorConstant.teal,
          ),
        ),
        centerTitle: true,
      ),
      body: books.isEmpty
          ? const EmptyBookmarkWidget()
          : Container(
              margin: const EdgeInsets.only(bottom: 60),
              child: Consumer<DbManager>(
                builder: (context, viewModel, child) {
                  return ListView(
                    padding: const EdgeInsets.all(16),
                    children: viewModel.books.map((book) {
                      return Dismissible(
                        key: Key(book.id!),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.all(16),
                          child: const Icon(
                            Icons.delete,
                            color: Colors.teal,
                          ),
                        ),
                        onDismissed: (direction) {
                          context.read<DbManager>().deleteBook(book.id);
                        },
                        child: HorizontalBookCardWidget(
                          id: book.id,
                          imageUrl: book.thumbnail,
                          title: book.title,
                          authors: book.authors,
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
    );
  }
}
