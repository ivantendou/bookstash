import 'package:bookstash/constants/colors_constant.dart';
import 'package:bookstash/constants/text_styles_constant.dart';
import 'package:bookstash/view_model/book_recommendation_view_model.dart';
import 'package:flutter/material.dart';
import 'package:bookstash/view/book_recommendation/widgets/index.dart';
import 'package:provider/provider.dart';

class BookRecommendationScreen extends StatefulWidget {
  const BookRecommendationScreen({super.key});

  @override
  State<BookRecommendationScreen> createState() => _BookRecommendationScreen();
}

class _BookRecommendationScreen extends State<BookRecommendationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _genreController = TextEditingController();
  final _languageController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _genreController.dispose();
    _languageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Book Recommendation',
          style: TextStyleConstant.heading1.copyWith(
            color: ColorConstant.teal,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                BookRecommendationForm(
                  controller: _genreController,
                  label: "Insert book's genre",
                  hintText: "Fiction",
                ),
                const SizedBox(
                  height: 16,
                ),
                BookRecommendationForm(
                  controller: _languageController,
                  label: "Insert book's language",
                  hintText: "Indonesian",
                ),
                const SizedBox(
                  height: 24,
                ),
                GetRecommendationButtonWidget(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context
                          .read<BookRecommendationViewModel>()
                          .getBookRecommendation(
                            _genreController.text,
                            _languageController.text,
                          );
                      _genreController.clear();
                      _languageController.clear();
                    }
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                Consumer<BookRecommendationViewModel>(
                  builder: (context, viewModel, child) {
                    var answer = viewModel.bookRecommendation;
                    if (viewModel.isLoading) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 150),
                        child: CircularProgressIndicator(
                          color: ColorConstant.teal,
                        ),
                      );
                    } else if (viewModel.bookRecommendation.isEmpty) {
                      return const InitialRecommendationWidget();
                    } else {
                      return RecommendationResultWidget(answer: answer);
                    }
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
