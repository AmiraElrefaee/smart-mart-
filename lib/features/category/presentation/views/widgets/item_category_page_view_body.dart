import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/features/category/presentation/views/widgets/section_best_sale_category.dart';
import 'package:smart_mart/features/category/presentation/views/widgets/section_define_category.dart';
import 'package:smart_mart/features/category/presentation/views/widgets/section_list_details_category.dart';
import 'package:smart_mart/features/category/presentation/views/widgets/section_photo_category.dart';

import '../../../../../const.dart';
import '../../../../home/presentation/views/widgets/Custom_show_item.dart';
import '../../../../home/presentation/views/widgets/custom_side_title.dart';
import '../../managers/Sub_category_cubit/sub_category_cubit.dart';
import 'custom_top_bar.dart';

class ItemCategoryPageViewBody extends StatefulWidget {
  const ItemCategoryPageViewBody({super.key});

  @override
  State<ItemCategoryPageViewBody> createState() => _ItemCategoryPageViewBodyState();
}

class _ItemCategoryPageViewBodyState extends State<ItemCategoryPageViewBody> {

  // late String categoryId;
  // late String title;
  //
  // @override
  // void initState() {
  //   super.initState();
  //
  //   final extra = GoRouter.of(context).routerDelegate.currentConfiguration.extra;
  //   if (extra is Map<String, String>) {
  //     categoryId = extra['id'] ?? '';
  //     title = extra['title'] ?? 'Default Title';
  //   } else {
  //     categoryId = '';
  //     title = 'Default Title';
  //   }

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
    // final title = GoRouterState.of(context).extra as String? ?? 'Default Title';
    final args = GoRouterState.of(context).extra as Map<String, dynamic>;
    final id = args['id'];
    final name = args['name'];
    final image = args['image'];

    double  screenWidth= MediaQuery.of(context).size.width;




      return  SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customTopBar(
            screenWidth: MediaQuery.of(context).size.width,
          ),
          sectionDefineCategory(screenWidth: screenWidth, title: name),
          SectionPhotoCategory(screenWidth: screenWidth,
          photo: image,
            title: name,
          ),
          SectionListDetailsCategory(screenWidth: screenWidth,
              DetailCategoryTop: DetailCategory,
          DetailCategoryBottom:DetailCategory ,
          ),



        ],
      ),
    );
  }
}

