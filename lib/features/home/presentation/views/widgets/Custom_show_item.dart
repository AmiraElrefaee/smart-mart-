import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/styles.dart';

class CustomShowItem extends StatelessWidget {
  const CustomShowItem({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width:screenWidth*.42,
      height:screenWidth*.6 ,
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
          height: screenWidth*.26,
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

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('84',
              style: Styles.Urbanist25.copyWith(
                color: kColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            Column(children: [
              Text('.00',
                style: Styles.Urbanist16.copyWith(
                  fontSize: 12,
                  color: kColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(' EGP',
                style: Styles.Urbanist16.copyWith(
                  fontSize: 10,
                ),
              )
            ],),

            Text('  EGP 90,20  ',
              style: Styles.Urbanist12.copyWith(
                  decoration: TextDecoration.lineThrough,
                  color: Color(0xffA5A5A5)
              ),),


            Container (
              width: 1, // عرض الخط
              height:  30, // طول الخط
              color: const Color(0xffDADADA), // لون الخط
            ),

            Padding(
              padding:  EdgeInsets.only(left: screenWidth*.03),
              child: InkWell(onTap: (){}
                  , child:SvgPicture.asset('assets/icons/Vector (4).svg',
                    height: screenWidth*.04,
                  )

              ),
            ),

          ],),
        SizedBox(height: 10,)

      ],),
    );
  }
}

