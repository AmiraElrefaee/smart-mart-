import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../home/presentation/views/widgets/section_grid_category.dart';
import '../../../data/models/category_model.dart';
import '../../managers/category_cubit/category_cubit.dart';
import 'custom_top_bar.dart';

class CategoryPageViewBody extends StatefulWidget {
  const CategoryPageViewBody({super.key});

  @override
  State<CategoryPageViewBody> createState() => _CategoryPageViewBodyState();
}

class _CategoryPageViewBodyState extends State<CategoryPageViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryCubit>().fetchCategories();
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(),
      child: Column(
        children: [
          customTopBar(screenWidth: screenWidth),
          Column(
            children: [
              SectionGridCategory(
                SideTitle: 'All Categories',
                screenWidth: screenWidth,
                numItems: 12,
              )
            ],
          ),
        ],
      ),
    );
  }
}
