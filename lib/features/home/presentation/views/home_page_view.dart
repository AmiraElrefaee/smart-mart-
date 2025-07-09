import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_mart/core/utils/service_locator.dart';
import 'package:smart_mart/features/category/presentation/managers/category_cubit/category_cubit.dart';
import 'package:smart_mart/features/category/presentation/managers/Sub_category_cubit/sub_category_cubit.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/home_page_view_body.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/section_drawer_home.dart';
import '../../../../const.dart';
import '../../../category/data/repo_imple/RepoSubCategoryImple.dart';
import '../../../category/data/repo_imple/repo_imple_category.dart';
import '../../../login/domain/use_case/login_use_case.dart';
import '../../../login/presentation/managers/login_cubit/login_cubit.dart';
import '../../../scan_code/presentation/view/scan_code_view.dart';


class HomePageView extends StatelessWidget {
  const HomePageView({super.key});
// final Map<String , dynamic> token ;
  @override
  Widget build(BuildContext context) {
    // print('from home view ${token}');


    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoryCubit>(
          create: (context) => CategoryCubit(getIt.get<RepoCategoryImple>()),
        ),
        BlocProvider<SubCategoryCubit>(
          create: (context) =>
              SubCategoryCubit(repoSubCategory: getIt.get<SubCategoryRepositoryImpl>()),
        ),
        // BlocProvider.value(value: context.read<LoginCubit>())

        // BlocProvider<LoginCubit>(
        //   create: (context) =>
        //       LoginCubit(getIt.get<LoginUseCase>()),
        // ),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: SectionDrawerHome(),
        body: HomePageViewBody(
          // token: token,
        ),
      ),
    );
  }
}
