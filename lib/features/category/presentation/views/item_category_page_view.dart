import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_mart/features/category/presentation/views/widgets/item_category_page_view_body.dart';

import '../../../../core/utils/service_locator.dart';
import '../../data/repo_imple/RepoSubCategoryImple.dart';
import '../../data/repo_imple/repo_imple_product_sub_category.dart';
import '../../dmain/repo/repo_product_sub_category.dart';
import '../managers/Sub_category_cubit/sub_category_cubit.dart';
import '../managers/product_sub_category_cubit/product_sub_category_cubit.dart';
import '../managers/selected_sub_category_cubit/selected_sub_category_cubit.dart';

class ItemCategoryPageView extends StatelessWidget {
  const ItemCategoryPageView({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SubCategoryCubit>(
          create: (context) => SubCategoryCubit(
            repoSubCategory: getIt.get<SubCategoryRepositoryImpl>(),
          )..fetchSubCategories(id: id),
        ),
        BlocProvider<SelectedSubCategoryCubit>(
          create: (context) => SelectedSubCategoryCubit(),
        ),
        BlocProvider<ProductSubCategoryCubit>(
          create: (context) => ProductSubCategoryCubit(
          getIt.get<RepoImpleProductSubCategory>(),
          ),
        ),
        // يمكنك إضافة أي Cubit إضافي هنا:
      ],
      child: SafeArea(
        child: Scaffold(
          body: ItemCategoryPageViewBody(),
        ),
      ),
    );
  }
}
