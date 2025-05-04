import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/styles.dart';

class CustomPrice extends StatelessWidget {
  const CustomPrice({
    super.key,
    required this.screenWidth, required this.price,
  });

  final double screenWidth;
  final num price ;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$price',
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

      ],);
  }
}

