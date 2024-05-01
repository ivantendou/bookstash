import 'package:bookstash/view/category_books/category_books_screen.dart';
import 'package:bookstash/view/detail/detail_screen.dart';
import 'package:bookstash/view/root/root_screen.dart';
import 'package:bookstash/view/search/search_screen.dart';
import 'package:bookstash/view/splash_screen.dart';
import 'package:bookstash/constants/colors_constant.dart';
import 'package:bookstash/constants/route_paths_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorConstant.teal,
        )),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Open Sans',
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: ColorConstant.tosca,
          selectionHandleColor: ColorConstant.tosca,
        ),
        iconTheme: IconThemeData(
          color: ColorConstant.tosca,
        ),
      ),
      routes: {
        RoutePaths.splash: (context) => const SplashScreen(),
        RoutePaths.root: (context) => const RootScreen(),
        RoutePaths.search: (context) => const SearchScreen(),
        RoutePaths.detail: (context) => const BookDetailScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == RoutePaths.categoryBooks) {
          final args = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => CategoryBooksScreen(
              categoryName: args,
            ),
          );
        }
        return null;
      },
    );
  }
}
