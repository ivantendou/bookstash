import 'package:bookstash/view/home/widgets/bookshelf_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:bookstash/view_model/home_view_model.dart';

void main() {
  testWidgets('BookshelfWidget Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider<HomeViewModel>(
              create: (_) => HomeViewModel(),
            ),
          ],
          child: const Scaffold(
            body: BookshelfWidget(),
          ),
        ),
      ),
    );

    expect(find.text('New Fiction Books'), findsOneWidget);
    expect(find.text('New History Books'), findsOneWidget);
    expect(find.text('New Programming Books'), findsOneWidget);
  });
}
