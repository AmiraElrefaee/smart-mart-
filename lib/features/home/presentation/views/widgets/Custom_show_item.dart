import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/functions/Navigate_to_page.dart';
import '../../../../../core/utils/functions/app_router.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_price.dart';

class CustomShowItem extends StatelessWidget {
  const CustomShowItem({
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
      child: Container(
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
            height: screenWidth*.25,
            ),
          ),
          Text('Cadbury Hot Chocolate',
            style: Styles.NexaBold14.copyWith(
                fontWeight: FontWeight.w500
            ),

          ),
          Text('3 in1 (300 gm)',
              style: Styles.NexaBold14.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Color(0xff484C52)
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

          CustomPrice(screenWidth: screenWidth),
          SizedBox(height: 10,)

        ],),
      ),
    );
  }
}

