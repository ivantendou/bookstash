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
    'author': 'Penulis 2 GIlaaaaaaaaaaaaaaaaaaaaaaa',
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

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bookmark List',
          style: TextStyleConstant.heading1.copyWith(
            color: ColorConstant.teal,
          ),
        ),
        centerTitle: true,
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
    );
  }
}
