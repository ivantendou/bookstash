import 'package:bookstash/constants/colors_constant.dart';
import 'package:bookstash/constants/text_styles_constant.dart';
import 'package:bookstash/models/category_model.dart';
import 'package:bookstash/view/home/widgets/book_card_shimmer_widget.dart';
import 'package:bookstash/view/home/widgets/home_search_bar_widget.dart';
import 'package:bookstash/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:bookstash/view/home/widgets/index.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

List<Map<String, String>> books = [
  {
    'title': 'Judul Buku 1',
    'author': 'Penulis 1',
  },
  {
    'title': 'Judul Buku 2 Panjang Banget Ga cukup',
    'author': 'Penulis 2',
  },
  {
    'title': 'Judul Buku 3',
    'author': 'Penulis 3',
  },
  {
    'title': 'Judul Buku 4',
    'author': 'Penulis 4',
  },
  {
    'title': 'Judul Buku 5',
    'author': 'Penulis 5',
  },
];

List<Category> categories = [
  Category(name: "Fantasy", icon: Icons.waving_hand),
  Category(name: "Science Fiction", icon: Icons.rocket),
  Category(name: "Mystery", icon: Icons.question_answer),
  Category(name: "Mystery1", icon: Icons.question_answer),
  Category(name: "Mystery2", icon: Icons.question_answer),
  Category(name: "Mystery3", icon: Icons.question_answer),
  Category(name: "Mystery4", icon: Icons.question_answer),
  Category(name: "Mystery5", icon: Icons.question_answer),
  Category(name: "Mystery6", icon: Icons.question_answer),
  Category(name: "Mystery", icon: Icons.question_answer),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeViewModel>(context, listen: false).getLatestBooks();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Bookstash',
          style: TextStyleConstant.heading1
              .copyWith(fontSize: 24, color: ColorConstant.tosca),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            const HomeSearchBarWidget(),
            const SizedBox(
              height: 24,
            ),
            const TextHeaderWidget(headerName: 'Categories'),
            const SizedBox(
              height: 24,
            ),
            CategoryCardWidget(categories: categories),
            const SizedBox(
              height: 16,
            ),
            const TextHeaderWidget(headerName: 'Latest Book'),
            const SizedBox(
              height: 16,
            ),
            Consumer<HomeViewModel>(
              builder: (context, viewModel, child) => SizedBox(
                height: 255,
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
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: viewModel.latestBooksList.length,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        itemBuilder: (context, index) {
                          final book = viewModel.latestBooksList[index];
                          return BookCardWidget(
                            title: book.volumeInfo?.title,
                            author: book.volumeInfo?.authors?[0],
                            imageUrl: book.volumeInfo?.imageLinks?.thumbnail
                                .toString(),
                          );
                        },
                      ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const TextHeaderWidget(headerName: 'Latest Book'),
            const SizedBox(
              height: 16,
            ),
            // SizedBox(
            //   height: 255,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: books.length,
            //     padding: const EdgeInsets.symmetric(horizontal: 8),
            //     itemBuilder: (context, index) {
            //       return BookCardWidget();
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
