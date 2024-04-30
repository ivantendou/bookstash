import 'package:bookstash/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:bookstash/screens/home/widgets/home_widgets_barrel.dart';

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
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeSearchBarWidget(),
              const SizedBox(
                height: 16,
              ),
              const HeaderWidget(headerName: 'Latest Book'),
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
              const HeaderWidget(headerName: 'Categories'),
              CategoryCardWidget(categories: categories),
            ],
          ),
        ),
      ),
    );
  }
}
