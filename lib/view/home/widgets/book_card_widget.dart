import 'package:bookstash/utils/constants/route_paths_constant.dart';
import 'package:bookstash/utils/constants/text_styles_constant.dart';
import 'package:bookstash/view_model/book_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookCardWidget extends StatelessWidget {
  final String? id;
  final String? title;
  final String? authors;
  final String? imageUrl;

  const BookCardWidget({
    super.key,
    required this.id,
    required this.title,
    required this.authors,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      width: 125,
      child: GestureDetector(
        onTap: () {
          Provider.of<BookDetailViewModel>(context, listen: false).selectedId =
              id;
          Navigator.pushNamed(
            context,
            RoutePaths.bookDetail,
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              height: 165,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrl ??
                      'https://i0.wp.com/thinkfirstcommunication.com/wp-content/uploads/2022/05/placeholder-1-1.png?resize=1024%2C683&ssl=1',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              title ?? '-',
              style: TextStyleConstant.body.copyWith(
                fontWeight: FontWeight.w700,
                overflow: TextOverflow.ellipsis,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              authors ?? '-',
              style: TextStyleConstant.body.copyWith(
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
