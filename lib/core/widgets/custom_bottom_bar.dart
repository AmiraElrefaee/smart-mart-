import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_mart/core/utils/styles.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    super.key,
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
            padding: const EdgeInsets.symmetric(vertical: 10,
            horizontal: 20
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                IconButton(onPressed: (){}, icon:Column(
                  children: [
                   SvgPicture.asset('assets/icons/Vector (6).svg'),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text('Home',
                          style: Styles.Urbanist13.copyWith(
                              color: Color(0xff484C52),
                              fontSize: 15,
                              fontWeight: FontWeight.w500
                          )
                      ),
                    ),
                  ],
                )),

                Spacer(flex: 1,),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: IconButton(onPressed: (){}, icon:Column(
                    children: [
                      SvgPicture.asset('assets/icons/Vector (9).svg'),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text('Wishlist',
                            style: Styles.Urbanist13.copyWith(
                                color: Color(0xff484C52),
                                fontSize: 15,
                                fontWeight: FontWeight.w500
                            )
                        ),
                      ),
                    ],
                  )),
                ),

                Spacer(flex: 4,),
                IconButton(onPressed: (){}, icon:Column(
                  children: [
                    SvgPicture.asset('assets/icons/Vector (7).svg'),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text('Cart',
                          style: Styles.Urbanist13.copyWith(
                              color: Color(0xff484C52),
                              fontSize: 15,
                              fontWeight: FontWeight.w500
                          )
                      ),
                    ),
                  ],
                )),
                Spacer(flex: 1,),
                IconButton(onPressed: (){}, icon:Column(
                  children: [
                    SvgPicture.asset('assets/icons/li_user.svg'),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text('Profile',
                        style: Styles.Urbanist13.copyWith(
                          color: Color(0xff484C52),
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                        )
                      ),
                    ),
                  ],
                )),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
