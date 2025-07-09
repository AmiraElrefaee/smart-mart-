import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/features/search/presentation/views/widgets/search_page_view_body.dart';
import 'package:smart_mart/features/search/presentation/views/widgets/srction_pick_up_for_you.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/functions/app_router.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../category/data/models/sub_category_model.dart';
import '../../../../category/presentation/managers/category_cubit/category_cubit.dart';
import '../../../../home/data/models/categories_item.dart';
import '../../../../home/presentation/managers/fetch_product_cubit/fetch_product_cubit.dart';
import '../../../../home/presentation/views/widgets/Custom_show_discount_item.dart';
import '../../../../home/presentation/views/widgets/Custom_show_item.dart';
import '../../managers/save_search_cubit/save_search_cubit.dart';
import 'Section_show_category.dart';
import 'custom_side_title_and_bottons.dart';
import 'custom_varial_item.dart';

class SectionBody extends StatelessWidget {
  const SectionBody({
    super.key,
    // required this.trendintItem,
    // required this.RecentItem,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {

    List <Map<String, dynamic>> RecentItem = [
      {'icons': FontAwesomeIcons.clockRotateLeft, 'title': ' tiger'},
      {'icons': FontAwesomeIcons.clockRotateLeft, 'title': ' tiger'},
      {'icons': FontAwesomeIcons.clockRotateLeft, 'title': ' tiger'},
      {'icons': FontAwesomeIcons.clockRotateLeft, 'title': ' tiger'},
      {'icons': FontAwesomeIcons.clockRotateLeft, 'title': ' tiger'},

    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
             Padding(
          padding: const EdgeInsets.only(right: 10,
              top: 20,
              bottom: 20
          ),
          child: CustomSideTitleAndBotton(
            title: 'Recent searches',
            botton: 'clear all',
            onTap: () { context.read<SaveSearchCubit>().clearRecentSearches();},
          ),
        ),

        CustomVrialItem(Item: RecentItem,),

        Padding(
          padding: const EdgeInsets.only(right: 10,
              top: 20,
              bottom: 20
          ),
          child: CustomSideTitleAndBotton(
            title: 'Pick up For you',
            botton: 'view all',
            onTap: () {},
          ),
        ),


        SectionPickUpForYou(screenWidth: screenWidth),

        Padding(
          padding: const EdgeInsets.only(right: 10,
              top: 20,
              bottom: 20
          ),
          child: CustomSideTitleAndBotton(
            title: 'Search by Categories',
            botton: 'view all',
            onTap: () {
              GoRouter.of(context).push(
                AppRouter.kcategory,
                // extra: state.categories.length ??0,
              );
            },
          ),
        ),

        SectionShowCategory(screenWidth: screenWidth),
      ],);
  }
}

