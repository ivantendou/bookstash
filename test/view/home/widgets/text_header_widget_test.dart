import 'package:bookstash/view/home/widgets/text_header_widget.dart';
import 'package:bookstash/view_model/book_category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('TextHeaderWidget renders correctly', (WidgetTester tester) async {
    var bookCategoryViewModel = BookCategoryViewModel();

    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => bookCategoryViewModel,
        child: const MaterialApp(
          home: Scaffold(
            body: TextHeaderWidget(
              headerName: 'Test Header',
              categoryName: 'Test Category',
            ),
          ),
        ),
      ),
    );

    expect(find.text('Test Header'), findsOneWidget);
    expect(find.text('More'), findsOneWidget);
  });

  testWidgets('TextHeaderWidget navigation test', (WidgetTester tester) async {
    var bookCategoryViewModel = BookCategoryViewModel();

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<BookCategoryViewModel>.value(value: bookCategoryViewModel),
        ],
        child: MaterialApp(
          routes: {
            "/book_category": (_) => const Material(
                  child: Scaffold(
                    body: Center(
                      child: Text("Book Category Page"),
                    ),
                  ),
                ),
          },
          home: Scaffold(
            body: Builder(
              builder: (context) => const TextHeaderWidget(
                headerName: 'Test Header',
                categoryName: 'Test Category',
              ),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('More'));
    await tester.pumpAndSettle();
    expect(bookCategoryViewModel.selectedCategory, 'Test Category');
  });
}
