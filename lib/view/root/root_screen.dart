import 'package:bookstash/utils/constants/image_constant.dart';
import 'package:bookstash/view/bookmark/screen/bookmark_screen.dart';
import 'package:bookstash/view/book_recommendation/screen/book_recommendation_screen.dart';
import 'package:bookstash/view/home/screen/home_screen.dart';
import 'package:bookstash/utils/constants/colors_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late PageController _pageController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  static final List<Widget> _widgetOptions = [
    const HomeScreen(),
    const BookmarkScreen(),
    const BookRecommendationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: _widgetOptions,
      ),
      backgroundColor: Colors.transparent,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: const DecorationImage(
            image: AssetImage(ImageConstant.background),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: GNav(
          tabBorderRadius: 15,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          color: ColorConstant.tosca,
          activeColor: ColorConstant.sageGreen,
          tabBackgroundColor: ColorConstant.sageGreen.withOpacity(0.1),
          gap: 8,
          padding: const EdgeInsets.all(6),
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.bookmark,
              text: 'Bookmark',
            ),
            GButton(
              icon: Icons.lightbulb,
              text: 'Recommendation',
            ),
          ],
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            });
          },
        ),
      ),
    );
  }
}
