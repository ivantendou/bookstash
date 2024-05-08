import 'package:bookstash/constants/gemini_ai.dart';
import 'package:bookstash/view_model/db_manager.dart';
import 'package:bookstash/view/book_category/screen/book_category_screen.dart';
import 'package:bookstash/view/book_detail/screen/book_detail_screen.dart';
import 'package:bookstash/view/root/root_screen.dart';
import 'package:bookstash/view/book_search/screen/search_screen.dart';
import 'package:bookstash/view/splash_screen.dart';
import 'package:bookstash/constants/colors_constant.dart';
import 'package:bookstash/constants/route_paths_constant.dart';
import 'package:bookstash/view_model/book_recommendation_view_model.dart';
import 'package:bookstash/view_model/book_category_view_model.dart';
import 'package:bookstash/view_model/book_detail_view_model.dart';
import 'package:bookstash/view_model/book_search_view_model.dart';
import 'package:bookstash/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

void main() {
  Gemini.init(apiKey: GeminiAi.apiKey, enableDebugging: true);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeViewModel>(create: (_) => HomeViewModel()),
        ChangeNotifierProvider<BookCategoryViewModel>(
            create: (_) => BookCategoryViewModel()),
        ChangeNotifierProvider<BookDetailViewModel>(
            create: (_) => BookDetailViewModel()),
        ChangeNotifierProvider<BookSearchViewModel>(
            create: (_) => BookSearchViewModel()),
        ChangeNotifierProvider<BookRecommendationViewModel>(
            create: (_) => BookRecommendationViewModel()),
        ChangeNotifierProvider<DbManager>(create: (_) => DbManager()),
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
      title: 'Bookstash',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xFF003300),
          ),
        ),
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
        RoutePaths.search: (context) => const BookSearchScreen(),
        RoutePaths.bookDetail: (context) => const BookDetailScreen(),
        RoutePaths.bookCategory: (context) => const BookCategoryScreen(),
      },
    );
  }
}
