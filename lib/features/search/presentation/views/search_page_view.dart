import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_mart/features/search/presentation/views/widgets/search_page_view_body.dart';

import '../../../../core/utils/service_locator.dart';
import '../../../category/data/repo_imple/RepoSubCategoryImple.dart';
import '../../../category/data/repo_imple/repo_imple_category.dart';
import '../../../category/presentation/managers/Sub_category_cubit/sub_category_cubit.dart';
import '../../../category/presentation/managers/category_cubit/category_cubit.dart';
import '../../data/api_service/saved_search_local_data_source.dart';
import '../../data/repo_imple/repo_imple_search_product.dart';
import '../../data/repo_imple/repo_imple_search_qrcode.dart';
import '../managers/save_search_cubit/save_search_cubit.dart';
import '../managers/search_cubit/search_cubit.dart';
import '../managers/search_qr_code_cubit/search_qr_code_cubit.dart';

class SearchPageView extends StatelessWidget {
  const SearchPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchCubit(getIt.get<RepoImpleSearchProduct>()),
        ),
        BlocProvider<CategoryCubit>(
          create: (context) => CategoryCubit(getIt.get<RepoCategoryImple>())..fetchCategories(),
        ),
        BlocProvider<SaveSearchCubit>(
          create: (context) => SaveSearchCubit(getIt.get<SearchLocalStorageService>())..loadRecentSearch(),
        ),
        BlocProvider<SearchQrCodeCubit>(
          create: (context) => SearchQrCodeCubit( getIt.get<RepoImpleSearchQrcode>()),
        ),
      ],
      child: Scaffold(

        body: SafeArea(child: SearchPageViewBody()),
      ),
    );
  }
}
