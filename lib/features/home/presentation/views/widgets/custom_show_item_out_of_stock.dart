import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/functions/Navigate_to_page.dart';
import '../../../../../core/utils/functions/app_router.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_price.dart';

class CustomShowItemOutOfStock extends StatelessWidget {
  const CustomShowItemOutOfStock({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

        navigateToPage(AppRouter.kdetails, context);
      },
      child: Stack(
        children: [
          Container(
            width:screenWidth*.42,
            height:screenWidth*.65 ,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(

                color: Color(0xffD9D9D9), // لون الحدود
                width: 1, // سمك الحدود
              ),
            ),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset('assets/items/image (1).png',
                  height: screenWidth*.2,
                ),
              ),
              Text('Cadbury Hot Chocolate',
                style: Styles.NexaBold14.copyWith(
                    fontWeight: FontWeight.w500,
                  fontSize: 12
                ),

              ),
              Text('3 in1 (300 gm)',
                  style: Styles.NexaBold14.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Color(0xff484C52),
                    fontSize: 10
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 140, // عرض الخط
                height: 1, // طول الخط
                color: Color(0xffDADADA), // لون الخط
              ),
              SizedBox(
                height: 5,
              ),

              CustomPrice(screenWidth: screenWidth,
              price: 0,
              ),
              SizedBox(height: 10,)

            ],),
          ),

          Positioned(
            top: screenWidth*.1,
            // left: 10,
            child: Container(
              height: screenWidth*.1,
              width: screenWidth*.18,
              decoration: BoxDecoration(
                  color: Color(0xffED1C24),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                      topRight: Radius.circular(12)
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2,
                    horizontal: 15
                ),
                child: Column(
                  children: [
                    Text('Out of',
                      style: Styles.Urbanist13.copyWith(
                          fontSize: 8,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                      ),
                    ),
                    Text('Stock',
                      style: Styles.Urbanist13.copyWith(
                          fontSize: 8,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

