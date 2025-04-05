import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/core/utils/functions/Navigate_to_page.dart';
import 'package:smart_mart/core/utils/functions/app_router.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/styles.dart';
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

    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.only(right:  screenWidth * .08, ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomSideTitle(
                screenWidth: screenWidth,
                text: '  $SideTitle',
                icon: 'assets/icons/Group 6.svg',
              ),
             numItems==9? InkWell(
                onTap: (){
                  navigateToPage(AppRouter.kcategory, context);
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
              ):Text(''),
            ],
          ),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal:screenWidth * .08 ),
          child: GridView.builder(
              shrinkWrap: true, // لجعل GridView تتكيف مع المحتوى
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // عدد العناصر في الصف
                crossAxisSpacing: 10, // المسافة بين العناصر أفقيًا
                mainAxisSpacing:10,

                mainAxisExtent: screenWidth * 0.3,

                // المسافة بين العناصر عموديًا

              ),
              itemCount: numItems,
              itemBuilder: (context, snapshot) {
                return InkWell(
                  onTap: (){
                    GoRouter.of(context).push(AppRouter.kitemCategory,
                      extra: catgoryModels[snapshot].title,
                      // catgoryModels[snapshot].title
                    );
                    // navigateToPage(AppRouter.kitemCategory, context,
                    //
                    // );
                  },
                  child: Container(
                    decoration: BoxDecoration(

                      color: Color(0xffF8F8F8),
                      borderRadius: BorderRadius.circular(10),

                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      Image.asset(catgoryModels[snapshot].image,
                        height:  screenWidth * .21,
                      ),
                      Text(catgoryModels[snapshot].title,
                        textAlign: TextAlign.center,
                        style: Styles.NexaBold14.copyWith(
                            fontSize: screenWidth*.03,
                            color: kColor
                        ),
                      )

                    ],),
                  ),
                );
              }
          ),
        ),
      ],
    );
  }
}

