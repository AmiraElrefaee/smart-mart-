import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/functions/app_router.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../category/presentation/managers/category_cubit/category_cubit.dart';
import '../../../../home/data/models/categories_item.dart';

class SectionShowCategory extends StatelessWidget {
  const SectionShowCategory({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,

      child: BlocBuilder<CategoryCubit, CategoryState>(
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
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.categories.length,
                itemBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsets.only(right: screenWidth * .02),

                      width: 101.w,
                      height: 99.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(

                        color: Color(0xffF8F8F8),
                        borderRadius: BorderRadius.circular(10),

                      ),
                      child: GestureDetector(
                        onTap: (){
                          GoRouter.of(context).push(
                              AppRouter.kitemCategory,
                              extra: {
                                'id': state.categories[index].id,
                                'name': state.categories[index].name,
                                'image': state.categories[index].image,
                              });
                        },
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 82.h,
                                child: CachedNetworkImage(

                                  imageUrl:state.categories[index].image,
                                  placeholder: (context, url) =>Text(''),
                                  errorWidget: (context, url, error) => Image.asset(catgoryModels[index].image,
                                    height: 82.h,
                                  ),
                                  height: screenWidth * .21,
                                ),
                              ),
                              Text(state.categories[index].name,
                                textAlign: TextAlign.center,
                                style: Styles.NexaBold14.copyWith(
                                    fontSize: 10.sp,
                                    color: kColor
                                ),
                              )

                            ]),
                      ));
                }
            );}

          else {
            return Center(child: Text('No categories available.'));
          }
        },
      ),
    );
  }
}

