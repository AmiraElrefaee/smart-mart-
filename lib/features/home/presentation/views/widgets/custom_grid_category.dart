import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/section_grid_category.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/section_title_grid_catgegory.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/functions/app_router.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../category/data/models/category_model.dart';
import '../../../data/models/categories_item.dart';

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
          SectionTilteInGridCategory(screenWidth: screenWidth
              , SideTitle: SideTitle, numItems: numItems),

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