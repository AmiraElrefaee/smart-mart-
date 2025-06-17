import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/core/utils/functions/Navigate_to_page.dart';
import 'package:smart_mart/core/utils/functions/app_router.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../category/data/models/category_model.dart';
import '../../../../category/presentation/managers/Sub_category_cubit/sub_category_cubit.dart';
import '../../../../category/presentation/managers/category_cubit/category_cubit.dart';
import '../../../data/models/categories_item.dart';
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
            return Center(child: CircularProgressIndicator());  // Display loading spinner while categories are loading
          }

          else if (state is CategoryFailure) {
            return Center(child: Text('Error: ${state.error}'));  // Show error message if failed
          }

          else if (state is CategorySuccess) {
            // هنا نقوم باستخدام الـ categories الموجودة في الـ state
            return
      Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: screenWidth * .08,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomSideTitle(
                screenWidth: screenWidth,
                text: '  $SideTitle',
                icon: 'assets/icons/Group 6.svg',
              ),
              numItems == 9 ? InkWell(
                onTap: () {
                  // navigateToPage(AppRouter.kcategory, context,
                  // );
                  if (state.categories.isEmpty) {
                    print('No categories available.');
                  } else {

                    GoRouter.of(context).push(
                      AppRouter.kcategory,
                      // extra: state.categories.length ??0,
                    );
                  }

                  // setState(() {
                  //   // viewall=!viewall;
                  // });
                },
                child: Text('view all',
                  style: Styles.NexaLight16.copyWith(
                      color: kColor,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ) : Text(''),
            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * .08),
          child:

        GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: screenWidth * 0.3,
        ),
        itemCount: numItems,  // استخدام طول الـ categories
        itemBuilder: (context, snapshot) {
          final CategoryModel category = state.categories[snapshot];  // استخدام الـ category من state
          return InkWell(
            onTap: () {

              GoRouter.of(context).push(
                AppRouter.kitemCategory,
                extra: {
                  'id': category.id,
                  'name': category.name,
                  'image': category.image,
                },


                // extra: state.categories[snapshot].name,  // استخدم title من الـ category
              );
            },

            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffF8F8F8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
          CachedNetworkImage(

          imageUrl: state.categories[snapshot].image,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
          height: screenWidth * .21,
          ),
          //
          // Image.network(state.categories[snapshot].image,
          //
          //         height:screenWidth * .21 ,
          //         ),

                  Text(
                    state.categories[snapshot].name,  // استخدم الـ title من الـ category
                    textAlign: TextAlign.center,
                    style: Styles.NexaBold14.copyWith(
                      fontSize: screenWidth * .02,
                      color: kColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ))]);
    } else {
      return Center(child: Text('No categories available.'));
    }
  },



        );
  }
}

