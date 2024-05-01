import 'package:bookstash/view/bookmark/bookmark_screen.dart';
import 'package:bookstash/view/home/home_screen.dart';
import 'package:bookstash/constants/colors_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = [
    const HomeScreen(),
    const BookmarkScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: ColorConstant.sageGreen, ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: GNav(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              color: ColorConstant.teal,
              activeColor: ColorConstant.tosca,
              tabBackgroundColor: ColorConstant.sageGreen,
              gap: 8,
              padding: const EdgeInsets.all(16),
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.bookmark,
                  text: 'Bookmark',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
