import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/const.dart';
import 'package:smart_mart/core/utils/functions/Navigate_to_page.dart';
import 'package:smart_mart/core/utils/functions/app_router.dart';

import '../../../../home/data/models/categories_item.dart';
import '../../../../home/presentation/views/widgets/custom_search_bar.dart';
import '../../../../home/presentation/views/widgets/custom_side_title.dart';
import '../../../../home/presentation/views/widgets/section_grid_category.dart';
import 'custom_top_bar.dart';

class CategoryPageViewBody extends StatelessWidget {
  const CategoryPageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth=MediaQuery.of(context).size.width;
    return Padding(
      padding:  EdgeInsets.only(),
      child: Column(
        children: [
          customTopBar(screenWidth: screenWidth),

          Column(children: [
            SectionGridCategory(
              SideTitle: 'All Categories',
              screenWidth: screenWidth,
              numItems: catgoryModels.length,
            )
          ],),



        ],
      ),
    );
  }
}

