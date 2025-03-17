import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../const.dart';
import '../../../../../core/utils/styles.dart';

class SectionSmartShopStartAtHome extends StatelessWidget {
  const SectionSmartShopStartAtHome({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          SvgPicture.asset(
            'assets/back_grounds/Rectangle 189.svg',
            width: screenWidth,
            height: screenWidth*.45,
          ),
          Positioned(
            bottom: screenWidth * .009,
            right: screenWidth * .61,
            child: SvgPicture.asset(
              'assets/back_grounds/Ellipse 19.svg',
              // height: screenWidth * .45,
            ),
          ),
          Positioned(
            left: screenWidth * .55,
            bottom: screenWidth * .07,


            child: SvgPicture.asset('assets/back_grounds/Frame 1984078149.svg',
              height: screenWidth*.29,
            ),
          ),
          Positioned(
            top: screenWidth * .07,
            left: screenWidth * .15,
            child: Text(
              'Smart shopping',
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: screenWidth * .045,
              ),
            ),
          ),
          Positioned(
            top: screenWidth * .125,
            left: screenWidth * .15,
            child: Text(
              ' starts at home',
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: screenWidth * .045,
              ),
            ),
          ),
          Positioned(
            top: screenWidth * .19,
            left: screenWidth * .15,
            child: SizedBox(
              width: screenWidth*.45,
              child: Text(
                'Create your list before you go and save time & money. ',
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w700,
                  color: Color(0xffFFCCCC),
                  fontSize: screenWidth * .03,
                ),
              ),
            ),
          ),
          Positioned(
            top: screenWidth * .29,
            left: screenWidth * .15,
            child: InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                height: 32,
                width: screenWidth * .3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Schedule & Shop',
                  style: Styles.Urbanist20.copyWith(
                    color: kColor,
                    fontSize: screenWidth * .03 ,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

