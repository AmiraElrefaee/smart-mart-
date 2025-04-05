import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_mart/features/category/presentation/views/widgets/category_page_view_body.dart';

class CategoryPageView extends StatelessWidget {
  const CategoryPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      body: CategoryPageViewBody(),
      ),
    );
  }
}
