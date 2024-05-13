import 'package:bookstash/view/home/widgets/books_carousel_widget.dart';
import 'package:bookstash/view/home/widgets/text_header_widget.dart';
import 'package:bookstash/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookshelfWidget extends StatelessWidget {
  const BookshelfWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          )),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextHeaderWidget(
              headerName: 'New Fiction Books',
              categoryName: 'Fiction',
            ),
            const SizedBox(
              height: 10,
            ),
            Consumer<HomeViewModel>(
              builder: (context, viewModel, child) {
                return BooksCarouselWidget(
                  booksList: viewModel.fictionBooksList,
                  isLoading: viewModel.isLoading,
                  isError: viewModel.isError,
                );
              },
            ),
            const SizedBox(
              height: 16,
            ),
            const TextHeaderWidget(
              headerName: 'New History Books',
              categoryName: 'History',
            ),
            const SizedBox(
              height: 10,
            ),
            Consumer<HomeViewModel>(
              builder: (context, viewModel, child) {
                return BooksCarouselWidget(
                  booksList: viewModel.historyBooksList,
                  isLoading: viewModel.isLoading,
                  isError: viewModel.isError,
                );
              },
            ),
            const SizedBox(
              height: 16,
            ),
            const TextHeaderWidget(
              headerName: 'New Programming Books',
              categoryName: 'Programming',
            ),
            const SizedBox(
              height: 10,
            ),
            Consumer<HomeViewModel>(
              builder: (context, viewModel, child) {
                return BooksCarouselWidget(
                  booksList: viewModel.programmingBooksList,
                  isLoading: viewModel.isLoading,
                  isError: viewModel.isError,
                );
              },
            ),
            const SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}
