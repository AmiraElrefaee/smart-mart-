import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_mart/const.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/section_best_sale.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/section_best_sale_photo.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/section_discount.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/custom_side_title.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/section_grid_category.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/section_scrolable_offer.dart';
import 'package:smart_mart/features/home/presentation/views/widgets/section_show_item_list_view.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../on_boarding/presentation/views/widgets/section_trigger_points.dart';
import 'Custom_show_discount_item.dart';
import 'Custom_show_item.dart';
import 'Section_ramadan_offers_photo.dart';
import 'custom_app_bar.dart';
import 'custom_search_bar.dart';

class HomePageViewBody extends StatefulWidget {
  const HomePageViewBody({super.key});

  @override
  State<HomePageViewBody> createState() => _HomePageViewBodyState();
}

class _HomePageViewBodyState extends State<HomePageViewBody> {
  final PageController _pageController = PageController();
  int currentIndex = 0; // لتتبع الصفحة الحالية
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
                padding: EdgeInsets.symmetric(horizontal: screenWidth * .05),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 34),
                    child: CustomAppBar(screenWidth: screenWidth),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 11),
                    child: CustomSearchBar(screenWidth: screenWidth),
                  ),
                  SizedBox(
                    height: 200, // ارتفاع ثابت لـ ListView
                    child: PageView.builder(
                      // controller: _pageController,
                      itemCount: 3,
                      onPageChanged: (index) {
                        setState(() {
                          currentIndex = index; // تحديث currentIndex عند تغيير الصفحة
                        });
                      },
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5),
                          child: SizedBox(
                            width: screenWidth * 0.86, // عرض كل عنصر في ListView
                            child: SectionDisconut(screenWidth: screenWidth),
                          ),
                        );
                      },
                    ),
                  ),
                  SectionTriggerPoints(currentIndex: currentIndex),
                ],),
              ),


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

              SizedBox(height: 70,),

              SectonShowItemLisView(screenWidth: screenWidth),

              SizedBox(height: 30,),

               SectionBestSale(screenWidth: screenWidth),
              SvgPicture.asset('assets/back_grounds/Group 20 (1).svg'),
              Text('amiia'),
              Text('amiia')


            ],
          ),
        ],
      ),
    );
  }
}

