import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_mart/const.dart';

import '../utils/styles.dart';

class CustomBottomBar2 extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  // final Function(int) onItemDoubleTap;

  const CustomBottomBar2({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
    // required this.onItemDoubleTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/Subtract.png', // Replace with your image path
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () => onItemTapped(0),

                  icon:  Column(
                    children: [
                      SvgPicture.asset('assets/icons/Vector (6).svg',

                        color: selectedIndex==0 ?kColor:Color(0xff484C52),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Home',
                          style: Styles.Urbanist13.copyWith(
                            color: selectedIndex == 0 ? kColor : Color(0xff484C52),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Spacer(flex: 1),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: IconButton(
                    onPressed: () => onItemTapped(1),
                    icon: Column(
                      children: [
                        SvgPicture.asset('assets/icons/Vector (9).svg',
                          color: selectedIndex==1 ?kColor:Color(0xff484C52),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            'Wishlist',
                            style: Styles.Urbanist13.copyWith(
                              color: selectedIndex == 1 ? kColor : Color(0xff484C52),
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Spacer(flex: 4),
                IconButton(
                  onPressed: () => onItemTapped(2),
                  icon: Column(
                    children: [
                      SvgPicture.asset('assets/icons/Vector (7).svg',
                        color: selectedIndex==2 ?kColor:Color(0xff484C52),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Cart',
                          style: Styles.Urbanist13.copyWith(
                            color: selectedIndex == 2 ? kColor: Color(0xff484C52),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(flex: 1),
                IconButton(
                  onPressed: () => onItemTapped(3),
                  icon: Column(
                    children: [
                      SvgPicture.asset('assets/icons/li_user.svg',
                        color: selectedIndex==3 ?kColor:Color(0xff484C52),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Profile',
                          style: Styles.Urbanist13.copyWith(
                            color: selectedIndex == 3 ? kColor : Color(0xff484C52),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}