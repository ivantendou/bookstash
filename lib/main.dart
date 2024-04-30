import 'package:bookstash/screens/root/root_screen.dart';
import 'package:bookstash/screens/search/search_screen.dart';
import 'package:bookstash/screens/splash_screen.dart';
import 'package:bookstash/utils/constants/colors_constant.dart';
import 'package:bookstash/utils/constants/route_paths_constant.dart';
import 'package:flutter/material.dart';

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
      },
    );
  }
}
