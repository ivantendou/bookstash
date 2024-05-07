import 'package:bookstash/constants/colors_constant.dart';
import 'package:bookstash/constants/text_styles_constant.dart';
import 'package:bookstash/view/book_category/widgets/horizontal_book_card_widget.dart';
import 'package:bookstash/view_model/book_category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookCategoryScreen extends StatefulWidget {
  const BookCategoryScreen({
    super.key,
  });

  @override
  State<BookCategoryScreen> createState() => _BookCategoryScreenState();
}

class _BookCategoryScreenState extends State<BookCategoryScreen> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.addListener(_scrollListener);
      Provider.of<BookCategoryViewModel>(context, listen: false).getBooks();
    });
  }

  @override
  Widget build(BuildContext context) {
    final categoryName = context.read<BookCategoryViewModel>().selectedCategory;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$categoryName Books',
          style: TextStyleConstant.heading1.copyWith(
            color: ColorConstant.sageGreen,
          ),
        ),
        backgroundColor: Colors.transparent,
        flexibleSpace: const Image(
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.cover,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: ColorConstant.sageGreen,
          size: 30,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.read<BookCategoryViewModel>().clearBook();
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Consumer<BookCategoryViewModel>(
          builder: (context, viewModel, child) {
            return ListView.builder(
              controller: scrollController,
              itemCount: viewModel.isLoadingMore
                  ? viewModel.books.length + 1
                  : viewModel.books.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(
                  top: 16, left: 16, right: 16, bottom: 50),
              itemBuilder: (context, index) {
                if (index < viewModel.books.length) {
                  final book = viewModel.books[index];
                  return Center(
                    child: HorizontalBookCardWidget(
                      id: book.id,
                      imageUrl:
                          book.volumeInfo?.imageLinks?.thumbnail?.toString(),
                      title: book.volumeInfo?.title,
                      authors: book.volumeInfo?.authors?.join(', '),
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      color: ColorConstant.teal,
                    ),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }

  void _scrollListener() {
    final maxScrollExtent = scrollController.position.maxScrollExtent;
    final pixels = scrollController.position.pixels;
    context
        .read<BookCategoryViewModel>()
        .handleScrollEvent(pixels, maxScrollExtent);
  }
}
