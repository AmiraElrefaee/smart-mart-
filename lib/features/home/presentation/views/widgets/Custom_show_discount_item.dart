import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/styles.dart';

class CustomShowDiscountItem extends StatelessWidget {
  const CustomShowDiscountItem({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // width:screenWidth*.42,
          // height:screenWidth*.55 ,
          padding: EdgeInsets.only(top:screenWidth*.04,
          // bottom:screenWidth*.01,
            right: screenWidth*.02,
            left: screenWidth*.02
          ),

          decoration: BoxDecoration(

            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(

              color: Color(0xffD9D9D9), // لون الحدود
              width: 1, // سمك الحدود
            ),
          ),
          child: Column(children: [
            Image.asset('assets/items/image (1).png',
              height: screenWidth*.22,
            ),
            Padding(
              padding:  EdgeInsets.only(top: screenWidth*.01),
              child: Text('JAGUAR Premium Creations - Layers Sour Cream & Onion',
                style: Styles.NexaBold14.copyWith(
                    fontWeight: FontWeight.w500,
                  fontSize: 10
                ),

              ),
            ),

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

            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20,
                  right: 25
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text('84',
                      style: Styles.Urbanist25.copyWith(
                        color: kColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 15
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: .0),
                      child: Column(children: [
                        Text('.00 ',
                          style: Styles.Urbanist16.copyWith(
                            fontSize: 10,
                            color: kColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(' EGP ',
                          style: Styles.Urbanist16.copyWith(
                            fontSize: 10,
                          ),
                        )
                      ],),
                    ),
                  ],),
                ),




                Container(
                  width: 1, // عرض الخط
                  height: 30, // طول الخط
                  color:const Color(0xffDADADA), // لون الخط
                ),

                Padding(
                  padding:  EdgeInsets.only(left:screenWidth*.05 ),
                  child: InkWell(onTap: (){}
                      , child:SvgPicture.asset('assets/icons/Vector (4).svg',
                      height: screenWidth*.04,
                      )

                      ),
                )

              ],)
          ],),
        ),


          Positioned(
            top: screenWidth*.06,
            left: screenWidth*.26,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff72FC97),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)
                )
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6,
                horizontal: 10
                ),
                child: Text('19% off',
                style: Styles.Urbanist13.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff484C52)
                ),
                ),
              ),
            ),
          ),

      ],
    );
  }
}

