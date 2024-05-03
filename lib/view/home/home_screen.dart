import 'package:bookstash/constants/colors_constant.dart';
import 'package:bookstash/constants/text_styles_constant.dart';
import 'package:bookstash/view/home/widgets/programming_books_carousel_widget.dart';
import 'package:bookstash/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:bookstash/view/home/widgets/index.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeViewModel>(context, listen: false)
          .getLatestFictionBooks();
      Provider.of<HomeViewModel>(context, listen: false)
          .getLatestHistoryBooks();
      Provider.of<HomeViewModel>(context, listen: false)
          .getLatestProgrammingBooks();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            'Bookstash',
            style: TextStyleConstant.heading1
                .copyWith(fontSize: 28, color: ColorConstant.teal),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              const HomeSearchBarWidget(),
              const SizedBox(
                height: 24,
              ),
              const CategoryCardWidget(),
              Container(
                padding: const EdgeInsets.only(top: 20),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    )),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextHeaderWidget(headerName: 'New Fiction Books'),
                    SizedBox(
                      height: 10,
                    ),
                    FictionBooksCarouselWidget(),
                    SizedBox(
                      height: 8,
                    ),
                    TextHeaderWidget(headerName: 'New History Books'),
                    SizedBox(
                      height: 10,
                    ),
                    HistoryBooksCarouselWidget(),
                    SizedBox(
                      height: 8,
                    ),
                    TextHeaderWidget(headerName: 'New Programming Books'),
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
            ],
          ),
        ),
      ),
    );
  }
}
