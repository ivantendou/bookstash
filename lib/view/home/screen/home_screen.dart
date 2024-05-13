import 'package:bookstash/utils/constants/colors_constant.dart';
import 'package:bookstash/utils/constants/image_constant.dart';
import 'package:bookstash/utils/constants/text_styles_constant.dart';
import 'package:bookstash/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:bookstash/view/home/widgets/index.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeViewModel>().getLatestFictionBooks();
      context.read<HomeViewModel>().getLatestHistoryBooks();
      context.read<HomeViewModel>().getLatestProgrammingBooks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageConstant.background),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            'Bookstash',
            style: TextStyleConstant.heading1
                .copyWith(fontSize: 28, color: ColorConstant.sageGreen),
          ),
        ),
        body: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 8,
              ),
              HomeSearchBarWidget(),
              SizedBox(
                height: 24,
              ),
              CategoryCardWidget(),
              BookshelfWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
