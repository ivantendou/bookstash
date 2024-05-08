import 'package:bookstash/constants/colors_constant.dart';
import 'package:bookstash/constants/text_styles_constant.dart';
import 'package:bookstash/models/db_manager.dart';
import 'package:bookstash/view/book_detail/widgets/book_information_card_widget.dart';
import 'package:bookstash/view_model/book_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class BookDetailScreen extends StatefulWidget {
  const BookDetailScreen({super.key});

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BookDetailViewModel>().getBookDetail();
    });
    
  }

  @override
  Widget build(BuildContext context) {
    final bookDetailViewModel =
        Provider.of<BookDetailViewModel>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Book Detail',
          style: TextStyleConstant.heading1.copyWith(
            color: ColorConstant.sageGreen,
          ),
        ),
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
            context.read<BookDetailViewModel>().clearBookDetail();
            context.read<DbManager>().getAllBooks();
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final isBookmarked = bookDetailViewModel.isCurrentBookmarked;
              if (isBookmarked) {
                bookDetailViewModel.unbookmarkBook();
              } else {
                await bookDetailViewModel.bookmarkBook();
              }
            },
            icon: Icon(bookDetailViewModel.isCurrentBookmarked
                ? Icons.bookmark
                : Icons.bookmark_border),
          ),
          const Icon(Icons.share),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Consumer<BookDetailViewModel>(
                  builder: (context, viewModel, child) {
                    final imageUrl =
                        viewModel.bookDetail.volumeInfo?.imageLinks?.thumbnail;
                    return viewModel.isLoading
                        ? Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              width: 160,
                              height: 220,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                            ),
                          )
                        : Container(
                            width: 160,
                            height: 220,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                imageUrl ??
                                    'https://i0.wp.com/thinkfirstcommunication.com/wp-content/uploads/2022/05/placeholder-1-1.png?resize=1024%2C683&ssl=1',
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                Consumer<BookDetailViewModel>(
                  builder: (context, viewModel, child) {
                    final book = viewModel.bookDetail;
                    return BookInformationCardWidget(
                      title: book.volumeInfo?.title,
                      authors: book.volumeInfo?.authors?.join(', '),
                      page: book.volumeInfo?.pageCount.toString(),
                      language: book.volumeInfo?.language?.toUpperCase(),
                      datePublished: book.volumeInfo?.publishedDate,
                      readLink: book.accessInfo?.webReaderLink,
                      buyLink: book.volumeInfo?.infoLink,
                    );
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Description',
                  style: TextStyleConstant.heading1,
                ),
                const SizedBox(
                  height: 18,
                ),
                Consumer<BookDetailViewModel>(
                  builder: (context, viewModel, child) {
                    final description = viewModel.description;
                    return viewModel.isLoading
                        ? Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              width: double.infinity,
                              height: 20,
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            description ?? '-',
                            textAlign: TextAlign.justify,
                            style: TextStyleConstant.body.copyWith(
                              fontSize: 16,
                            ),
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
