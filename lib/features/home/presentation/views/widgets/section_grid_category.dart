import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/core/utils/functions/Navigate_to_page.dart';
import 'package:smart_mart/core/utils/functions/app_router.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../category/data/models/category_model.dart';
import '../../../../category/presentation/managers/Sub_category_cubit/sub_category_cubit.dart';
import '../../../../category/presentation/managers/category_cubit/category_cubit.dart';
import '../../../data/models/categories_item.dart';
import 'custom_grid_category.dart';
import 'custom_side_title.dart';

class SectionGridCategory extends StatelessWidget {
  const SectionGridCategory({
    super.key,
    required this.screenWidth, required this.numItems, required this.SideTitle,

  });

  final double screenWidth;

  // bool viewall=false;
  final int numItems;
  final String SideTitle;

  @override
  Widget build(BuildContext context) {
    return

      BlocConsumer<CategoryCubit, CategoryState>(
        listener: (context, state) {
          if (state is CategoryLoading) {
            print('Loading categories...');
          } else if (state is CategorySuccess) {
            print('Categories loaded successfully');
          } else if (state is CategoryFailure) {
            print('Failed to load categories: ${state.error}');
          } },
        builder: (context, state) {
          if (state is CategoryLoading) {
            return
              Center(child: CircularProgressIndicator(
                color: kColor,));  // Display loading spinner while categories are loading
          }

           if (state is CategoryFailure) {
            return Center(child: Text('Error: ${state.error}'));  // Show error message if failed
          }

          else if (state is CategorySuccess ) {
            // هنا نقوم باستخدام الـ categories الموجودة في الـ state
            return
            customGridCategory(
          screenWidth: screenWidth,
          SideTitle: SideTitle,
          numItems: numItems,
              category:  state.categories,
          );
    } else {
      return Center(child: Text('No categories available.'));
    }
  },



        );
  }
}



