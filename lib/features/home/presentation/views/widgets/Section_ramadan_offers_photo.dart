import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SectionRamdanOffersPhoto extends StatelessWidget {
  const SectionRamdanOffersPhoto({
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
        top: screenWidth*.06,
        left:screenWidth*.035 ,
        child: Text('RAMADAN',
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w800,
            color: Colors.white,
            fontSize: screenWidth * .035,
          ),
        ),
      ),
      Positioned(
        top: screenWidth*.1,
        left:screenWidth*.05 ,
        child: Text('OFFERS',
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: screenWidth * .035,
          ),
        ),
      ),
      Positioned(
          top: screenWidth*.012,
          left: screenWidth*.13,
          child:
          Image.asset('assets/back_grounds/lantern 1.png')),
      Positioned(
          top: screenWidth*.1,
          left: screenWidth*.028,
          child:
          Image.asset('assets/back_grounds/lantern 2.png'))
    ],);
  }
}
