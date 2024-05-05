import 'package:bookstash/view/home/widgets/book_card_shimmer_widget.dart';
import 'package:bookstash/view/home/widgets/book_card_widget.dart';
import 'package:bookstash/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class FictionBooksCarouselWidget extends StatelessWidget {
  const FictionBooksCarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, viewModel, child) {
        return SizedBox(
          height: 210,
          child: viewModel.isLoading
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
              : viewModel.isError
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
                      itemCount: viewModel.fictionBooksList.length,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      itemBuilder: (context, index) {
                        final book = viewModel.fictionBooksList[index];
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
      },
    );
  }
}
