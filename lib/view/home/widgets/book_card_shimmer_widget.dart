import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class BookCardShimmerWidget extends StatelessWidget {
  const BookCardShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      width: 160,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                color: Colors.white,
              ),
              height: 200,
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              width: double.infinity,
              height: 16,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              width: double.infinity,
              height: 14,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
