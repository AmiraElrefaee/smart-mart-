import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/core/utils/service_locator.dart';
import 'package:smart_mart/features/category/presentation/views/widgets/category_page_view_body.dart';

import '../../data/models/category_model.dart';
import '../../data/repo_imple/repo_imple_category.dart';
import '../managers/category_cubit/category_cubit.dart';

class CategoryPageView extends StatelessWidget {
  const CategoryPageView({super.key});

  @override
  Widget build(BuildContext context) {

    return
      BlocProvider(
      create: (context) => CategoryCubit(getIt.get<RepoCategoryImple>(),

      ),
      child:
      SafeArea(
        child: Scaffold(
          body: CategoryPageViewBody(),
        ),
      ),
    );
  }
}
