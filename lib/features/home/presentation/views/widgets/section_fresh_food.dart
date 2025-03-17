import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/styles.dart';
import 'Custom_show_item.dart';
import 'custom_botton_category_food.dart';

class SectionFreshFood extends StatelessWidget {
  const SectionFreshFood({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth,
      height: screenWidth*1.5,
      child: Stack(
        // fit : StackFit.passthrough,
        children: [
          Positioned.fill(
            top: 0,
            left: 0,
            right: 0,
            bottom:screenWidth*.23,
            child: SvgPicture.asset('assets/back_grounds/Group 35.svg',
              fit: BoxFit.cover,
              width: screenWidth,
              // height: 50,
            ),
          ),
          Positioned(
            top: screenWidth*.23,
            left: screenWidth*.24,
            child: Text('FRESH',
              style: Styles.Urbanist32.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 35,
                  color: Colors.white
              ),),
          ),
          Positioned(
            top: screenWidth*.3,
            left: screenWidth*.35,
            child: Text(' FOOD',
              style: Styles.Urbanist32.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 35,
                  color: Colors.white
              ),),
          ),

          Positioned(
              top: screenWidth*.19,
              left: screenWidth*.58,
              child: SvgPicture.asset('assets/back_grounds/Group 38.svg',
                height: screenWidth*.2,
              )),
          Positioned(
              top: screenWidth*.44,
              // left: screenWidth*.05,
              child:
              Padding(
                padding: const EdgeInsets.only(right: 10,
                left: 8
                ),
                child: Row(

                  children: [
                    CustomBottomCategoryFood(screenWidth: screenWidth
                      , Photo: 'assets/items/image 49.png',
                      text: ' Milk',
                      color: kColor,

                    ),
                    CustomBottomCategoryFood(screenWidth: screenWidth
                      , Photo: 'assets/items/image (3).png',
                      text: ' Cheese & Labneh',
                      color: Colors.black,

                    ),
                    CustomBottomCategoryFood(screenWidth: screenWidth
                      , Photo: 'assets/items/image (2).png',
                      text: ' Cold cuts',
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
                padding: const EdgeInsets.only(left: 8),
                child: Row(

                  children: [
                    CustomBottomCategoryFood(screenWidth: screenWidth
                      , Photo: 'assets/items/image (4).png',
                      text: ' Yoghurt',
                      color: Colors.black,

                    ),
                    CustomBottomCategoryFood(screenWidth: screenWidth
                      , Photo: 'assets/items/image (5).png',
                      text: ' Meat',
                      color: Colors.black,

                    ),
                    CustomBottomMore(screenWidth: screenWidth)



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
