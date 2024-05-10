import 'package:bookstash/constants/route_paths_constant.dart';
import 'package:bookstash/view/book_search/screen/search_screen.dart';
import 'package:bookstash/view_model/book_search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bookstash/view/home/widgets/home_search_bar_widget.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('HomeSearchBarWidget UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: HomeSearchBarWidget(),
        ),
      ),
    );

    expect(find.byType(Container), findsExactly(2));
    expect(find.byType(GestureDetector), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    expect(find.text('Search book & author'), findsOneWidget);
  });

  testWidgets('HomeSearchBarWidget Tap Test', (WidgetTester tester) async {
    final mockNavigatorKey = GlobalKey<NavigatorState>();
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<BookSearchViewModel>(
            create: (_) =>
                BookSearchViewModel(),
          ),
        ],
        child: MaterialApp(
          navigatorKey: mockNavigatorKey,
          home: const Scaffold(
            body: HomeSearchBarWidget(),
          ),
          routes: {
            RoutePaths.search: (context) => const BookSearchScreen(),
          },
        ),
      ),
    );

    await tester.tap(find.byType(GestureDetector));
    await tester.pumpAndSettle();
    expect(mockNavigatorKey.currentState!.canPop(), true);
  });
}
