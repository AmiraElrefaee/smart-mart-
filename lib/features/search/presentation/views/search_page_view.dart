import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_mart/features/search/presentation/views/widgets/search_page_view_body.dart';

class SearchPageView extends StatelessWidget {
  const SearchPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(child: SearchPageViewBody()),
    );
  }
}
