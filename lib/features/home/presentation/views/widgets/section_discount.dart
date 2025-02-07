import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/styles.dart';

class SectionDisconut extends StatelessWidget {
  const SectionDisconut({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          'assets/back_grounds/Rectangle 189.svg',
          width: screenWidth,
          height: 190,
        ),
        Positioned(
          bottom: screenWidth * .14,
          right: screenWidth * .61,
          child: SvgPicture.asset(
            'assets/back_grounds/Group 28.svg',
            height: screenWidth * .25,
          ),
        ),
        Positioned(
          left: screenWidth * .43,
          bottom: screenWidth * .04,
          height: 177,
          width: 188,
          child: Image.asset('assets/back_grounds/SCAN 3 1 (1).png'),
        ),
        Positioned(
          top: screenWidth * .08,
          left: screenWidth * .15,
          child: Text(
            'Up to 20%',
            style: TextStyle(
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: screenWidth * .045,
            ),
          ),
        ),
        Positioned(
          top: screenWidth * .145,
          left: screenWidth * .2,
          child: Text(
            'Offers',
            style: TextStyle(
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: screenWidth * .045,
            ),
          ),
        ),
        Positioned(
          top: screenWidth * .21,
          left: screenWidth * .15,
          child: Text(
            'enjoy our big deal',
            style: TextStyle(
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: screenWidth * .03,
            ),
          ),
        ),
        Positioned(
          top: screenWidth * .28,
          left: screenWidth * .15,
          child: InkWell(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              height: 29,
              width: screenWidth * .27,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Explore',
                style: Styles.Urbanist20.copyWith(
                  color: kColor,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}