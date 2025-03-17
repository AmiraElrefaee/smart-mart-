import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_mart/const.dart';
import 'package:smart_mart/core/utils/functions/Navigate_to_page.dart';
import 'package:smart_mart/core/utils/functions/app_router.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/sectionBakeryAndPastry.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/section_best_sale.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/section_best_sale_photo.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/section_discount.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/custom_side_title.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/section_fresh_food.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/section_grid_category.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/section_scrolable_offer.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/section_show_item_list_view.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/section_smart_start_at_home.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/section_up_to_offers.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../on_boarding/presentation/views/widgets/section_trigger_points.dart';
import 'Custom_show_discount_item.dart';
import 'Custom_show_item.dart';
import 'Section_ramadan_offers_photo.dart';
import 'custom_app_bar.dart';
import 'custom_botton_category_food.dart';
import 'custom_search_bar.dart';

class HomePageViewBody extends StatefulWidget {
  const HomePageViewBody({super.key});

  @override
  State<HomePageViewBody> createState() => _HomePageViewBodyState();
}

class _HomePageViewBodyState extends State<HomePageViewBody> {
  final PageController _pageController = PageController();
  // int currentIndex = 0; // لتتبع الصفحة الحالية
  bool viewall=false;
  @override
  void dispose() {
    _pageController.dispose(); // تحرير الذاكرة عند التخلص من الـ Widget
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding:  EdgeInsets.only(top: 34,
                left: screenWidth * .05,
                  right: screenWidth * .05,
                ),
                child: CustomAppBar(screenWidth: screenWidth,


                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 11,
                  left: screenWidth * .05,
                  right: screenWidth * .05,
                ),
                child: CustomSearchBar(
                  readOnly: true,
                  screenWidth: screenWidth,
                onTap: (){
                  GoRouter.of(context).push(AppRouter.kSearch);
                  // navigateToPage(AppRouter.kSearch, context);
                },
                ),
              ),
              SectionUpToOffers(screenWidth: screenWidth),


              CustomSideTitle(
                screenWidth: screenWidth,
              text: ' Offers',
                icon: 'assets/icons/Vector (3).svg',
              ),
              SectionScrolableOffers(screenWidth: screenWidth),
              SizedBox(
                height: 20,
              ),

           SectionGridCategory(screenWidth: screenWidth),



              SectonShowItemLisView(screenWidth: screenWidth),

              SizedBox(height: 30,),

               SectionBestSale(screenWidth: screenWidth),


            ],
          ),

          SizedBox(height: 20,),
          SectionBakeryAndPastry(screenWidth: screenWidth),
    Padding(
      padding:  const EdgeInsets.only(left: 20,
      top: 20,),
      child: Text('Don t shop without a list',
      style: Styles.Urbanist16.copyWith(
        fontWeight: FontWeight.w700,
        color: Colors.black
      ),
      ),
    ),
    SectionSmartShopStartAtHome(screenWidth: screenWidth),
    SectionFreshFood(screenWidth: screenWidth),

          SizedBox(height: 150,)



        ],
      ),
    );
  }
}


