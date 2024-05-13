import 'dart:async';

import 'package:bookstash/utils/constants/colors_constant.dart';
import 'package:bookstash/utils/constants/text_styles_constant.dart';
import 'package:bookstash/view_model/book_search_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchBarWidget extends StatefulWidget {
  final Key? formKey;
  final TextEditingController searchController;
  const SearchBarWidget(
      {super.key, required this.formKey, required this.searchController});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    final bookSearchViewModel =
        Provider.of<BookSearchViewModel>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: SizedBox(
            height: 60,
            child: Form(
              key: widget.formKey,
              child: TextFormField(
                controller: widget.searchController,
                style: TextStyleConstant.buttonLabel.copyWith(
                  color: ColorConstant.teal,
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  fillColor: ColorConstant.sageGreen,
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  label: Text(
                    'Search book & author',
                    style: TextStyleConstant.buttonLabel.copyWith(
                      color: ColorConstant.tosca,
                      fontSize: 18,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ),
                  hintText: 'Search book & author',
                  hintStyle: TextStyleConstant.buttonLabel.copyWith(
                    color: ColorConstant.tosca,
                    fontSize: 18,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      widget.searchController.clear();
                    },
                    icon: Icon(
                      Icons.clear,
                      color: ColorConstant.teal,
                      size: 30,
                    ),
                  ),
                ),
                textAlignVertical: TextAlignVertical.center,
                textInputAction: TextInputAction.search,
                onChanged: (query) {
                  if (_debounce?.isActive ?? false) _debounce?.cancel();
                  _debounce = Timer(const Duration(milliseconds: 500), () {
                    bookSearchViewModel.clearBook();
                    bookSearchViewModel.getBooks(query);
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}
