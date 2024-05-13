import 'package:bookstash/models/get_books_response.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'book_card_shimmer_widget.dart';
import 'book_card_widget.dart';

class BooksCarouselWidget extends StatelessWidget {
  final List<Item> booksList;
  final bool isLoading;
  final bool isError;

  const BooksCarouselWidget({
    Key? key,
    required this.booksList,
    required this.isLoading,
    required this.isError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: isLoading || isError
          ? Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemBuilder: (context, index) =>
                    const BookCardShimmerWidget(),
              ),
            )
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: booksList.length,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemBuilder: (context, index) {
                final book = booksList[index];
                return BookCardWidget(
                  id: book.id,
                  title: book.volumeInfo?.title,
                  authors: book.volumeInfo?.authors?.join(', '),
                  imageUrl: book.volumeInfo?.imageLinks?.thumbnail
                      ?.toString(),
                );
              },
            ),
    );
  }
}
