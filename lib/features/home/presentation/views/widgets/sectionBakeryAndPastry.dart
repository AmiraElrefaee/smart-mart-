import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/styles.dart';
import 'Custom_show_item.dart';
import 'custom_botton_category_food.dart';
import 'custom_show_item_out_of_stock.dart';
import 'home_page_view_body.dart';

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

              child:
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(

                  children: [
                    CustomBottomCategoryFood(screenWidth: screenWidth
                      , Photo: 'assets/items/pngwing.com (24) 1.png',
                      text: ' Croissants & Pate',
                      color: kColor,

                    ),
                    CustomBottomCategoryFood(screenWidth: screenWidth
                      , Photo: 'assets/items/pngwing.com (23) 1.png',
                      text: ' Bread',
                      color: Colors.black,

                    ),
                    CustomBottomCategoryFood(screenWidth: screenWidth
                      , Photo: 'assets/items/pngwing.com (25) 1.png',
                      text: ' Rice',
                      color: Colors.black,

                    ),


                  ],
                ),
              )
          ),
          Positioned(
              top: screenWidth*.57,
              // left: screenWidth*.05,
              child:
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(

                  children: [
                    CustomBottomCategoryFood(screenWidth: screenWidth
                      , Photo: 'assets/items/pngwing.com (26) 1 (1).png',
                      text: ' Dessert',
                      color: Colors.black,

                    ),
                    CustomBottomCategoryFood(screenWidth: screenWidth
                      , Photo: 'assets/items/pngwing.com (27) 1.png',
                      text: ' Biscuits & crackers',
                      color: Colors.black,

                    ),
                    CustomBottomMore(screenWidth: screenWidth,)


                  ],
                ),
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
                      child: index==0?
                      CustomShowItemOutOfStock(screenWidth: screenWidth,):
                      CustomShowItem(screenWidth: screenWidth),
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

