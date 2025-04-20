import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/features/category/presentation/views/widgets/section_best_sale_category.dart';
import 'package:smart_mart/features/category/presentation/views/widgets/section_define_category.dart';
import 'package:smart_mart/features/category/presentation/views/widgets/section_list_details_category.dart';
import 'package:smart_mart/features/category/presentation/views/widgets/section_photo_category.dart';

import '../../../../../const.dart';
import '../../../../home/presentation/views/widgets/Custom_show_item.dart';
import '../../../../home/presentation/views/widgets/custom_side_title.dart';
import 'custom_top_bar.dart';

class ItemCategoryPageViewBody extends StatelessWidget {
  const ItemCategoryPageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final  List<Map<String, String>> DetailCategory=[
      {'title':'Baby Diapers',
        'photo':'assets/category/image 55.png'
      },
      {'title':'Wipes & creams',
        'photo':'assets/category/image56.png'
      },
      {'title':'Baby Milk',
        'photo':'assets/category/Baby_Milk_734678aa30.png'
      },
      {'title':'Baby Food',
        'photo':'assets/category/Baby_Food_6c7ceb03ef 1.png'
      }
    ];
    final title = GoRouterState.of(context).extra as String? ?? 'Default Title';

    double  screenWidth= MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customTopBar(
            screenWidth: MediaQuery.of(context).size.width,
          ),
          sectionDefineCategory(screenWidth: screenWidth, title: title),
          SectionPhotoCategory(screenWidth: screenWidth),
          SectionListDetailsCategory(screenWidth: screenWidth,
              DetailCategoryTop: DetailCategory,
          DetailCategoryBottom:DetailCategory ,
          ),
          // SectionListDetailsCategory(screenWidth: screenWidth,
          //     DetailCategoryTop: DetailCategory),

          // SectionBestSaleCategory(screenWidth: screenWidth),
      
      
        ],
      ),
    );
  }
}

