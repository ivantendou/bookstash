import 'package:bookstash/view/home/widgets/bookshelf_widget.dart';
import 'package:bookstash/view/home/widgets/category_card_widget.dart';
import 'package:bookstash/view/home/widgets/home_search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bookstash/view/home/screen/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:bookstash/view_model/home_view_model.dart';

void main() {
  testWidgets('Home Screen UI Test', (WidgetTester tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider<HomeViewModel>(
            create: (_) => HomeViewModel(),
            child: const HomeScreen(),
          ),
        ),
      );

      expect(find.text('Bookstash'), findsOneWidget);
      expect(find.byType(HomeSearchBarWidget), findsOneWidget);
      expect(find.byType(CategoryCardWidget), findsOneWidget);
      expect(find.byType(BookshelfWidget), findsOneWidget);
    });
  });
}
