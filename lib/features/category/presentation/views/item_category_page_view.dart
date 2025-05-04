import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_mart/features/category/presentation/views/widgets/item_category_page_view_body.dart';

import '../../../../core/utils/service_locator.dart';
import '../../data/repo_imple/RepoSubCategoryImple.dart';
import '../managers/Sub_category_cubit/sub_category_cubit.dart';

class ItemCategoryPageView extends StatelessWidget {
  const ItemCategoryPageView({super.key, required this.id});
final String id ;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SubCategoryCubit(
        repoSubCategory: getIt.get<SubCategoryRepositoryImpl>(),
      )..fetchSubCategories(id:id )
      ..fetchSubCategories(id: id),
      child: SafeArea(
        child: Scaffold(
          body: ItemCategoryPageViewBody(),
        ),
      ),
    );
  }
}
