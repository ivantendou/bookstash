import 'package:bookstash/constants/colors_constant.dart';
import 'package:bookstash/constants/text_styles_constant.dart';
import 'package:bookstash/models/category_model.dart';
import 'package:bookstash/view/home/widgets/programming_books_carousel_widget.dart';
import 'package:bookstash/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:bookstash/view/home/widgets/index.dart';
import 'package:provider/provider.dart';

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
      Provider.of<HomeViewModel>(context, listen: false).getLatestFictionBooks();
      Provider.of<HomeViewModel>(context, listen: false).getLatestHistoryBooks();
      Provider.of<HomeViewModel>(context, listen: false).getLatestProgrammingBooks();
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
              .copyWith(fontSize: 28, color: ColorConstant.tosca),
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
              height: 2,
            ),
            const TextHeaderWidget(headerName: 'New Fiction Books'),
            const SizedBox(
              height: 16,
            ),
            const FictionBooksCarouselWidget(),
            const SizedBox(
              height: 16,
            ),
            const TextHeaderWidget(headerName: 'New History Books'),
            const SizedBox(
              height: 16,
            ),
            const HistoryBooksCarouselWidget(),
            const SizedBox(
              height: 16,
            ),
            const TextHeaderWidget(headerName: 'New Programming Books'),
            const SizedBox(
              height: 16,
            ),
            const ProgrammingBooksCarouselWidget(),
          ],
        ),
      ),
    );
  }
}
