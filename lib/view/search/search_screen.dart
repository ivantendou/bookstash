import 'package:bookstash/view/search/widgets/search_bar_widget.dart';
import 'package:bookstash/constants/colors_constant.dart';
import 'package:bookstash/constants/text_styles_constant.dart';
import 'package:flutter/material.dart';

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
  {
    'title': 'Judul Buku 6',
    'author': 'Penulis 6',
  },
];

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          toolbarHeight: 70,
          title: const SearchBarWidget(),
          iconTheme: IconThemeData(
            color: ColorConstant.teal,
            size: 30,
          ),
          backgroundColor: Colors.white70,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10, top: 15, bottom: 15),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: books.length,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, index) {
            final item = books[index];
            return Container(
              height: 120,
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
                    height: 100,
                    width: 80,
                    decoration: BoxDecoration(
                      color: ColorConstant.teal,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Text(
                          item['title']!,
                          maxLines: 2,
                          style: TextStyleConstant.heading3.copyWith(
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(
                          item['author']!,
                          style: TextStyleConstant.body.copyWith(
                            fontWeight: FontWeight.w400,
                            overflow: TextOverflow.ellipsis,
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
