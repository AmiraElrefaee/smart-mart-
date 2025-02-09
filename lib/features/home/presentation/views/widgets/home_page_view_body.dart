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
    SizedBox(
    width: screenWidth,
    height: screenWidth*1.46,
    child: Stack(
    // fit : StackFit.passthrough,
    children: [
    Positioned.fill(
    top: 0,
    left: 0,
    right: 0,
    bottom:screenWidth*.23,
    child: SvgPicture.asset('assets/back_grounds/Group 35.svg',
    fit: BoxFit.fitWidth,
    width: screenWidth,
    // height: 50,
    ),
    ),
    Positioned(
    top: screenWidth*.19,
    left: screenWidth*.17,
    child: Text('FRESH',
    style: Styles.Urbanist32.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: 35,
    color: Colors.white
    ),),
    ),
    Positioned(
    top: screenWidth*.27,
    left: screenWidth*.26,
    child: Text(' FOOD',
    style: Styles.Urbanist32.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: 35,
    color: Colors.white
    ),),
    ),
    Positioned(
    top: screenWidth*.44,
    left: screenWidth*.05,
    child:
    Container(

    padding: EdgeInsets.symmetric(horizontal: 9,vertical: 5),
    decoration: BoxDecoration(
    color: Colors.white,

    borderRadius: BorderRadius.circular(10),
    ),
    child: Row(children: [
    Image.asset('assets/items/pngwing.com (24) 1.png',
    ),
    Text(' Croissants & Pate',
    style: Styles.Urbanist15.copyWith(
    color: kColor,
    fontWeight: FontWeight.w600
    ),

    )
    ],),
    )
    ),
    Positioned(
    top: screenWidth*.44,
    left: screenWidth*.51,
    child:
    Container(

    padding: EdgeInsets.symmetric(horizontal: 9,vertical: 5),
    decoration: BoxDecoration(
    color: Colors.white,

    borderRadius: BorderRadius.circular(10),
    ),
    child: Row(children: [
    Image.asset('assets/items/pngwing.com (23) 1.png',
    ),
    Text(' Bread',
    style: Styles.Urbanist15.copyWith(

    fontWeight: FontWeight.w500
    ),

    )
    ],),
    )
    ),
    Positioned(
    top: screenWidth*.44,
    left: screenWidth*.78,
    child:
    Container(

    padding: EdgeInsets.symmetric(horizontal: 9,vertical: 5),
    decoration: BoxDecoration(
    color: Colors.white,

    borderRadius: BorderRadius.circular(10),
    ),
    child: Row(children: [
    Image.asset('assets/items/pngwing.com (25) 1.png',
    ),
    Text(' Rice',
    style: Styles.Urbanist15.copyWith(

    fontWeight: FontWeight.w500
    ),

    )
    ],),
    )
    ),
    Positioned(
    top: screenWidth*.57,
    left: screenWidth*.05,
    child:
    Container(

    padding: EdgeInsets.symmetric(horizontal: 9,vertical: 5),
    decoration: BoxDecoration(
    color: Colors.white,

    borderRadius: BorderRadius.circular(10),
    ),
    child: Row(children: [
    Image.asset('assets/items/pngwing.com (26) 1 (1).png',
    ),
    Text(' Dessert',
    style: Styles.Urbanist15.copyWith(

    fontWeight: FontWeight.w500
    ),

    )
    ],),
    )
    ),
    Positioned(
    top: screenWidth*.57,
    left: screenWidth*.33,
    child:
    Container(

    padding: EdgeInsets.symmetric(horizontal: 9,vertical: 5),
    decoration: BoxDecoration(
    color: Colors.white,

    borderRadius: BorderRadius.circular(10),
    ),
    child: Row(children: [
    Image.asset('assets/items/pngwing.com (27) 1.png',
    ),
    Text(' Biscuits & crackers',
    style: Styles.Urbanist15.copyWith(

    fontWeight: FontWeight.w500
    ),

    )
    ],),
    )
    ),
    Positioned(
    top: screenWidth*.57,
    left: screenWidth*.75,
    child:
    Container(

    padding: EdgeInsets.symmetric(horizontal: 18,vertical: 8),
    decoration: BoxDecoration(
    color: Colors.white,

    borderRadius: BorderRadius.circular(10),
    ),
    child: Row(children: [
    SvgPicture.asset('assets/icons/Group 6.svg',
    ),
    Text('  more',
    style: Styles.Urbanist15.copyWith(
    color: kColor,
    fontWeight: FontWeight.w500
    ),

    )
    ],),
    )
    ),
    Positioned(
    top: screenWidth*.75,
    left: screenWidth*.09,
    child: Text('Best Products',
    style: Styles.Urbanist20.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: 25,
    color: Colors.white

    ),),
    ),

    Positioned.fill(
    top: screenWidth*.9,
    child: SizedBox(
    // height: screenWidth*.4,
    child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: 5,
    itemBuilder: (context,index) {
    return Padding(
    padding: const EdgeInsets.only(left: 15),
    child: CustomShowItem(screenWidth: screenWidth),
    );
    }
    ),
    ),
    ),
    ],
    ),
    )



        ],
      ),
    );
  }
}

class SectionBakeryAndPastry extends StatelessWidget {
  const SectionBakeryAndPastry({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
    width: screenWidth,
    height: screenWidth*1.46,
    child: Stack(
    // fit : StackFit.passthrough,
    children: [
    Positioned.fill(
    top: 0,
    left: 0,
    right: 0,
    bottom:screenWidth*.23,
    child: SvgPicture.asset('assets/back_grounds/Group 37.svg',
    fit: BoxFit.fitWidth,
    width: screenWidth,
    // height: 50,
    ),
    ),
        Positioned(
          top: screenWidth*.19,
          left: screenWidth*.17,
          child: Text('Bakery',
          style: Styles.Urbanist32.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 35,
            color: Colors.white
          ),),
        ),
      Positioned(
        top: screenWidth*.27,
        left: screenWidth*.26,
        child: Text('& Pastry',
          style: Styles.Urbanist32.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 35,
              color: Colors.white
          ),),
      ),
        Positioned(
            top: screenWidth*.44,
            left: screenWidth*.05,
            child:
            Container(

    padding: EdgeInsets.symmetric(horizontal: 9,vertical: 5),
    decoration: BoxDecoration(
      color: Colors.white,

      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(children: [
      Image.asset('assets/items/pngwing.com (24) 1.png',
          ),
      Text(' Croissants & Pate',
      style: Styles.Urbanist15.copyWith(
        color: kColor,
        fontWeight: FontWeight.w600
      ),

      )
    ],),
            )
          ),
      Positioned(
          top: screenWidth*.44,
          left: screenWidth*.51,
          child:
          Container(

            padding: EdgeInsets.symmetric(horizontal: 9,vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,

              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(children: [
              Image.asset('assets/items/pngwing.com (23) 1.png',
              ),
              Text(' Bread',
                style: Styles.Urbanist15.copyWith(

                    fontWeight: FontWeight.w500
                ),

              )
            ],),
          )
      ),
      Positioned(
          top: screenWidth*.44,
          left: screenWidth*.78,
          child:
          Container(

            padding: EdgeInsets.symmetric(horizontal: 9,vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,

              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(children: [
              Image.asset('assets/items/pngwing.com (25) 1.png',
              ),
              Text(' Rice',
                style: Styles.Urbanist15.copyWith(

                    fontWeight: FontWeight.w500
                ),

              )
            ],),
          )
      ),
      Positioned(
          top: screenWidth*.57,
          left: screenWidth*.05,
          child:
          Container(

            padding: EdgeInsets.symmetric(horizontal: 9,vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,

              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(children: [
              Image.asset('assets/items/pngwing.com (26) 1 (1).png',
              ),
              Text(' Dessert',
                style: Styles.Urbanist15.copyWith(

                    fontWeight: FontWeight.w500
                ),

              )
            ],),
          )
      ),
      Positioned(
          top: screenWidth*.57,
          left: screenWidth*.33,
          child:
          Container(

            padding: EdgeInsets.symmetric(horizontal: 9,vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,

              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(children: [
              Image.asset('assets/items/pngwing.com (27) 1.png',
              ),
              Text(' Biscuits & crackers',
                style: Styles.Urbanist15.copyWith(

                    fontWeight: FontWeight.w500
                ),

              )
            ],),
          )
      ),
      Positioned(
          top: screenWidth*.57,
          left: screenWidth*.75,
          child:
          Container(

            padding: EdgeInsets.symmetric(horizontal: 18,vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,

              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(children: [
              SvgPicture.asset('assets/icons/Group 6.svg',
              ),
              Text('  more',
                style: Styles.Urbanist15.copyWith(
                  color: kColor,
                    fontWeight: FontWeight.w500
                ),

              )
            ],),
          )
      ),
      Positioned(
        top: screenWidth*.75,
        left: screenWidth*.09,
        child: Text('Best Products',
          style: Styles.Urbanist20.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 25,
              color: Colors.white

          ),),
      ),

        Positioned.fill(
        top: screenWidth*.9,
        child: SizedBox(
        // height: screenWidth*.4,
        child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context,index) {
        return Padding(
        padding: const EdgeInsets.only(left: 15),
        child: CustomShowItem(screenWidth: screenWidth),
        );
        }
        ),
        ),
        ),
        ],
        ),
        );
  }
}

class SectionUpToOffers extends StatefulWidget {
  const SectionUpToOffers({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  State<SectionUpToOffers> createState() => _SectionUpToOffersState();
}

class _SectionUpToOffersState extends State<SectionUpToOffers> {
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.screenWidth * .05),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 34),
          child: CustomAppBar(screenWidth: widget.screenWidth),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 11),
          child: CustomSearchBar(screenWidth: widget.screenWidth),
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
                  width: widget.screenWidth * 0.86, // عرض كل عنصر في ListView
                  child: SectionDisconut(screenWidth: widget.screenWidth),
                ),
              );
            },
          ),
        ),
        SectionTriggerPoints(currentIndex: currentIndex),
      ],),
    );
  }
}

