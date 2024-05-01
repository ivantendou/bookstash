import 'package:bookstash/constants/colors_constant.dart';
import 'package:bookstash/constants/route_paths_constant.dart';
import 'package:bookstash/constants/text_styles_constant.dart';
import 'package:bookstash/model/category_model.dart';
import 'package:bookstash/view/home/widgets/home_search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:bookstash/view/home/widgets/index.dart';

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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            SizedBox(
              height: 255,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: books.length,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemBuilder: (context, index) {
                  return BookCardWidget(item: books[index]);
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const TextHeaderWidget(headerName: 'Latest Book'),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 255,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: books.length,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemBuilder: (context, index) {
                  return BookCardWidget(item: books[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
