import 'package:bookstash/view/category_books/book_category_screen.dart';
import 'package:bookstash/view/detail/detail_screen.dart';
import 'package:bookstash/view/root/root_screen.dart';
import 'package:bookstash/view/search/search_screen.dart';
import 'package:bookstash/view/splash_screen.dart';
import 'package:bookstash/constants/colors_constant.dart';
import 'package:bookstash/constants/route_paths_constant.dart';
import 'package:bookstash/view_model/book_category_view_model.dart';
import 'package:bookstash/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => BookCategoryViewModel()),
      ],
      child: const MyApp(),
    ),
  );
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
        RoutePaths.bookDetail: (context) => const BookDetailScreen(),
        RoutePaths.bookCategory: (context) => const BookCategoryScreen(),
      },
    );
  }
}
