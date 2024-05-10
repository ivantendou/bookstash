import 'package:bookstash/view/home/widgets/fiction_books_carousel_widget.dart';
import 'package:bookstash/view/home/widgets/history_books_carousel_widget.dart';
import 'package:bookstash/view/home/widgets/programming_books_carousel_widget.dart';
import 'package:bookstash/view/home/widgets/text_header_widget.dart';
import 'package:flutter/material.dart';

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
      child: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextHeaderWidget(
              headerName: 'New Fiction Books',
              categoryName: 'Fiction',
            ),
            SizedBox(
              height: 10,
            ),
            FictionBooksCarouselWidget(),
            SizedBox(
              height: 16,
            ),
            TextHeaderWidget(
              headerName: 'New History Books',
              categoryName: 'History',
            ),
            SizedBox(
              height: 10,
            ),
            HistoryBooksCarouselWidget(),
            SizedBox(
              height: 16,
            ),
            TextHeaderWidget(
              headerName: 'New Programming Books',
              categoryName: 'Programming',
            ),
            SizedBox(
              height: 10,
            ),
            ProgrammingBooksCarouselWidget(),
            SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}
