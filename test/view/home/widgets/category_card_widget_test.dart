import 'package:bookstash/view_model/book_category_view_model.dart';
import 'package:bookstash/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:bookstash/view/home/widgets/category_card_widget.dart';

void main() {
  testWidgets('CategoryCardWidget Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<HomeViewModel>(
            create: (_) => HomeViewModel(),
          ),
          ChangeNotifierProvider<BookCategoryViewModel>(
            create: (_) =>
                BookCategoryViewModel(),
          ),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: CategoryCardWidget(),
          ),
        ),
      ),
    );

    expect(find.byType(GestureDetector),
        findsWidgets);
    expect(find.byType(Container), findsWidgets);
    expect(find.byType(Column), findsWidgets);
    expect(find.byType(Text), findsWidgets);
  });
}
