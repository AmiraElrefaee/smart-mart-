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
            //   customGridCategory(
            //   screenWidth: screenWidth,
            //   SideTitle: SideTitle,
            //   numItems: numItems,
            //   category:  [],
            // );

              Center(child: CircularProgressIndicator(
                color: kColor,

              ));  // Display loading spinner while categories are loading
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

class customGridCategory extends StatelessWidget {
  const customGridCategory({
    super.key,
    required this.screenWidth,
    required this.SideTitle,
    required this.numItems, required this.category,
  });

  final double screenWidth;
  final String SideTitle;
  final int numItems;
 final List<CategoryModel>  category;
  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
      SectionTilteInGridCategory(screenWidth: screenWidth, SideTitle: SideTitle, numItems: numItems),

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
      itemCount: numItems ,  // استخدام طول الـ categories
      itemBuilder: (context, snapshot) {
        final CategoryModel categor = category[snapshot];  // استخدام الـ category من state
        return InkWell(
          onTap: () {

            GoRouter.of(context).push(
              AppRouter.kitemCategory,
              extra: {
                'id': categor.id,
                'name': categor.name,
                'image': categor.image,
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

        imageUrl:
        category[snapshot].image ,
        placeholder: (context, url) =>Text(''),
        errorWidget: (context, url, error) => Image.asset(catgoryModels[snapshot].image,
        height: screenWidth * .21,
        ),
        //     Icon(Icons.error,
        // color: kColor,
        // ),
        height: screenWidth * .21,
        ),
        //

                Text(
                  category[snapshot].name ??'',  // استخدم الـ title من الـ category
                  textAlign: TextAlign.center,
                  style: Styles.NexaBold14.copyWith(
                    fontSize: 10.sp,
                    color: kColor,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ))
    ]);
  }
}

class SectionTilteInGridCategory extends StatelessWidget {
  const SectionTilteInGridCategory({
    super.key,
    required this.screenWidth,
    required this.SideTitle,
    required this.numItems,
  });

  final double screenWidth;
  final String SideTitle;
  final int numItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              // if (state.categories.isEmpty) {
              //   print('No categories available.');
              // } else {

                GoRouter.of(context).push(
                  AppRouter.kcategory,
                  // extra: state.categories.length ??0,
                );
              // }

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
    );
  }
}

