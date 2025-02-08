import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class sectionBestSalePhoto extends StatelessWidget {
  const sectionBestSalePhoto({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [

      SvgPicture.asset('assets/back_grounds/Group 29.svg',

        height: screenWidth*.22,),
      Positioned(
        top: screenWidth*.05,
        left:screenWidth*.07 ,
        child: Text('BEST',
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w800,
            color: Colors.white,
            fontSize: screenWidth * .035,
          ),
        ),
      ),
      Positioned(
        top: screenWidth*.09,
        left:screenWidth*.07 ,
        child: Text('SALE',
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: screenWidth * .035,
          ),
        ),
      )
    ],);
  }
}

