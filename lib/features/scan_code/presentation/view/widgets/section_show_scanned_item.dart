import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/section_add_or_scaa.dart';
import 'package:smart_mart/features/scan_code/presentation/view/widgets/section_top_bar.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../details_item/presentation/views/widgets/section_description_and_higlight.dart';
import '../../../../details_item/presentation/views/widgets/section_open_link.dart';
import '../../../../details_item/presentation/views/widgets/section_prices.dart';
import '../../../../details_item/presentation/views/widgets/section_show_product_photo.dart';
import '../../../../home/presentation/views/widgets/Custom_show_item.dart';
import '../../../../home/presentation/views/widgets/custom_price.dart';
import 'SectionAddMore.dart';
import 'bottons_scanned_item.dart';
import 'custom_add_or_minus.dart';

class SectionShowScannedItem extends StatelessWidget {
  const SectionShowScannedItem({super.key});



  get controller => null;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
        children: [
          // Scrollable content
          Padding(
            padding: EdgeInsets.only(top: screenWidth*.25), // Adjust based on `SectionTopBar` height
            child: SingleChildScrollView(
              controller: controller,
              child: Container(
                color: Colors.white,
                width: screenWidth,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * .04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sectionDetailsSCannedItem(screenHeight: screenHeight, screenWidth: screenWidth),
                          SizedBox(height: 150),
                        ],
                      ),
                    ),


                  ],
                ),
              ),
            ),
          ),

          // Fixed Top Bar
          TopBarScannedItem(),
          bottonsScannedItem()
        ]);
  }
}

class sectionDetailsSCannedItem extends StatelessWidget {
  const sectionDetailsSCannedItem({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: screenHeight*.12,
          width: screenWidth*.21,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
           width: 1 ,
           color: Color(0xffDADADA)
            )
          ),
          child: Image.asset('assets/items/moraba.png',

          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          Text('Vitrac Strawberry Jam ',
            style: Styles.NexaBold14.copyWith(
                fontWeight: FontWeight.w500
            ),

          ),
          Text(' 850 gm',
            style: Styles.NexaBold14.copyWith(
                fontWeight: FontWeight.w500
            ),),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('EGP 64.95',
              style: TextStyle(
                fontFamily: 'Urbanist'
                    ,fontSize: 16,
                color: kColor,
                fontWeight: FontWeight.w600
              ),
              ),
              SizedBox(
                width: 5,
              ),
              Text('EGP 64.95',

                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                    fontFamily: 'Urbanist'
                    ,fontSize: 16,
                    color: Color(0xff989797),
                    fontWeight: FontWeight.w600,

                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          // Container(
          //   width: 140, // عرض الخط
          //   height: 1, // طول الخط
          //   color: Color(0xffDADADA), // لون الخط
          // ),
          SizedBox(
            height: 5,
          ),

          // CustomPrice(screenWidth: screenWidth),
          SizedBox(height: 10,)

        ],),
        CustomAddOrMinusBotton()

      ],
    );
  }
}


class TopBarScannedItem extends StatelessWidget {
  const TopBarScannedItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.only(bottom: 20,
            top: 20
        ),
        decoration: BoxDecoration(
          color: Colors.white, // Background color
          borderRadius: BorderRadius.circular(10),
          // boxShadow: [
          //   BoxShadow(
          //     color:ksecodaryColor.withOpacity(0.1), // Shadow color with opacity
          //     spreadRadius: .5, // How much the shadow spreads
          //     blurRadius: 2, // Blurriness of the shadow
          //     offset: Offset(0, 4), // Moves shadow down (X: 0, Y: 4)
          //   ),
          // ],
        ),
        child: Column(children: [
          Container(
            margin:EdgeInsets.only(
                bottom: 25
            ),
            width: MediaQuery.of(context).size.width*.35,
            height: 5,

            decoration: BoxDecoration(
                color: Color(0xffDADADA),
                borderRadius: BorderRadius.circular(20)
            ),

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Cart ',
                style: TextStyle(
                    fontFamily: 'Urbanist',
                    color: Color(0xff484C52),
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                ),
              )
              , Text('( 3 items )',
                style: TextStyle(
                    fontFamily: 'Urbanist',
                    color: Color(0xff989797),
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                ),
              )
            ],),


        ],),
      ),
    );
  }
}
