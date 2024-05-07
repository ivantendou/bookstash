import 'package:bookstash/constants/colors_constant.dart';
import 'package:bookstash/constants/text_styles_constant.dart';
import 'package:bookstash/view/book_recommendation/widgets/book_recommendation_form_widget.dart';
import 'package:bookstash/view_model/book_recommendation_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
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
                  height: 16,
                ),
                ElevatedButton(
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
                  
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      ColorConstant.teal,
                    ),
                    foregroundColor: MaterialStateProperty.all<Color>(
                      ColorConstant.sageGreen,
                    ),
                    
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.search),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Get Recommendation',
                        style: TextStyleConstant.buttonLabel,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Consumer<BookRecommendationViewModel>(
                  builder: (context, viewModel, child) {
                    var answer = viewModel.bookRecommendation;
                    if (viewModel.isLoading) {
                      return const CircularProgressIndicator();
                    } else if (viewModel.bookRecommendation.isEmpty) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.search,
                            size: 100,
                            color: Colors.grey,
                          ),
                          Text(
                            'Start searching for books',
                            style: TextStyleConstant.buttonLabel.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorConstant.teal),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Markdown(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            data: answer,
                            styleSheet: MarkdownStyleSheet(
                              p: TextStyleConstant.body.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      );
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
