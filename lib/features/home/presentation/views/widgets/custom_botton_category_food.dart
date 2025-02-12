import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/styles.dart';

class CustomBottomCategoryFood extends StatelessWidget {
  const CustomBottomCategoryFood({
    super.key,
    required this.screenWidth, required this.Photo, required this.text, required this.color,
  });

  final double screenWidth;
  final String Photo;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(horizontal: 9,vertical: 8),
      margin: EdgeInsets.only(right: screenWidth*.02 ),
      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(children: [
        Image.asset(Photo,
          // height: screenWidth*.075,
          // width: screenWidth*.085,
        ),
        Text(text,
          style: Styles.Urbanist15.copyWith(
              color: color,
              fontWeight: FontWeight.w600
          ),

        )
      ],),
    );
  }
}
class CustomBottomMore extends StatelessWidget {
  const CustomBottomMore({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(horizontal: screenWidth*.05,vertical: screenWidth*.022),
      margin: EdgeInsets.only(right: screenWidth*.02 ),
      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(children: [
        SvgPicture.asset('assets/icons/Group 6.svg',
          // height: screenWidth*.08,
          // width: screenWidth*.086,
        ),
        Text(' more',
          style: Styles.Urbanist15.copyWith(
              color: kColor,
              fontWeight: FontWeight.w600
          ),

        )
      ],),
    );
  }
}



