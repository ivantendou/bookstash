import 'package:bookstash/constants/colors_constant.dart';
import 'package:bookstash/constants/text_styles_constant.dart';
import 'package:bookstash/screens/detail/widgets/book_information_card.dart';
import 'package:flutter/material.dart';

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Book Detail',
          style: TextStyleConstant.heading1.copyWith(
            color: ColorConstant.sageGreen,
          ),
        ),
        centerTitle: true,
        backgroundColor: ColorConstant.teal,
        iconTheme: IconThemeData(
          color: ColorConstant.sageGreen,
          size: 30,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: const [
          Icon(Icons.bookmark_border),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.share),
          SizedBox(
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
                Container(
                  width: 200,
                  height: 240,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: ColorConstant.tosca,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const BookInformationCardWidget(),
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
                Text(
                  'Lorem  Ipsum Dolor Sir Amet Expectro Patronum Monosodium Glutamat Kurawa Pandawa Rasengan Chidoriii Sharingann ',
                  textAlign: TextAlign.justify,
                  style: TextStyleConstant.body.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
