import 'package:bookstash/constants/text_styles_constant.dart';
import 'package:bookstash/view/book_search/widgets/horizontal_book_card_widget.dart';
import 'package:bookstash/view/book_search/widgets/search_bar_widget.dart';
import 'package:bookstash/constants/colors_constant.dart';
import 'package:bookstash/view_model/book_search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookSearchScreen extends StatefulWidget {
  const BookSearchScreen({super.key});

  @override
  State<BookSearchScreen> createState() => _BookSearchScreenState();
}

class _BookSearchScreenState extends State<BookSearchScreen> {
  final _formKey = GlobalKey<FormState>();
  final _searchController = TextEditingController();
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          toolbarHeight: 80,
          title: SearchBarWidget(
            formKey: _formKey,
            searchController: _searchController,
          ),
          iconTheme: IconThemeData(
            color: ColorConstant.sageGreen,
            size: 30,
          ),
          backgroundColor: Colors.transparent,
          flexibleSpace: const Image(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 10, top: 15, bottom: 15),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                context.read<BookSearchViewModel>().clearBook();
                Navigator.pop(context);
              },
            ),
          ),
        ),
        body: Center(
          child: Consumer<BookSearchViewModel>(
            builder: (context, viewModel, child) {
              if (viewModel.books.isEmpty) {
                if (_searchController.text.isEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.search,
                        size: 100,
                        color: Colors.grey,
                      ),
                      Text(
                        'Start searching for books',
                        style: TextStyleConstant.buttonLabel.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  );
                } else if (viewModel.isLoadingMore) {
                  return CircularProgressIndicator(
                    color: ColorConstant.teal,
                  );
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.search_off_outlined,
                        size: 100,
                        color: Colors.grey,
                      ),
                      Text(
                        'No results found',
                        style: TextStyleConstant.buttonLabel.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  );
                }
              } else {
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
                          imageUrl: book.volumeInfo?.imageLinks?.thumbnail
                              ?.toString(),
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
              }
            },
          ),
        ),
      ),
    );
  }

  void _scrollListener() {
    final viewModel = Provider.of<BookSearchViewModel>(context, listen: false);
    final maxScrollExtent = scrollController.position.maxScrollExtent;
    final pixels = scrollController.position.pixels;
    viewModel.handleScrollEvent(
        pixels, maxScrollExtent, _searchController.text);
  }
}
