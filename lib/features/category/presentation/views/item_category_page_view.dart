import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_mart/features/category/presentation/views/widgets/item_category_page_view_body.dart';

class ItemCategoryPageView extends StatelessWidget {
  const ItemCategoryPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ItemCategoryPageViewBody(),
      ),
    );
  }
}
